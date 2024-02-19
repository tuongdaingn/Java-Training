create database DB_2_TE_QS_VN;
drop database DB_2_TE_QS_VN;
use DB_2_TE_QS_VN;
drop table Departments;
create table Departments(
            department_id int(10) PRIMARY KEY ,
            department_name varchar(30) not null,
            department_description text,
            creat_at datetime,
            update_at datetime
);
create table Users(
    user_id int(10) primary key ,
    first_name varchar(30) not null ,
    last_name varchar(30) not null ,
    email varchar(100),
    phone varchar(20),
    employee_id varchar(10),
    avatar text,
    department_id int(10),
    gender tinyint(10),
    age int(100),
    created_at datetime,
    updated_at datetime
);
create table user_department(
    user_department_id int(10) primary key ,
    user_id int(10),
    department_id int(10),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    foreign key (department_id) references  Departments(department_id),
    start_date date,
    end_date date,
    created_at datetime,
    updated_at datetime
);
create table Role(
    role_id INT(10) PRIMARY KEY not null ,
    role_name varchar(30) not null,
    creat_at datetime,
    update_at datetime
);
create table user_role(
    user_role_id int(10) primary key not null ,
    user_department_id int(10),
    role_id int(10),
    foreign key (user_department_id) references user_department(user_department_id),
    foreign key (role_id) references Role(role_id),
    start_date date,
    end_date date,
    created_at datetime,
    updated_at datetime
);
create table salary(
    salary_id int(10) primary key not null ,
    user_role_id int(10),
    foreign key(user_role_id) references user_role(user_role_id),
    total_salary double(12,2),
    salary_month varchar(255) not null ,
    salary_year varchar(255) not null ,
    create_at datetime,
    updated_at datetime
);
drop table salary_detail;
CREATE TABLE salary_detail (
                               id INT(10) PRIMARY KEY not null ,
                               amount double(12, 2),
                               salary_id INT(10),
                               salary_detail_type_id INT(10),
                               FOREIGN KEY (salary_id) REFERENCES salary(salary_id),
                               FOREIGN KEY (salary_detail_type_id) REFERENCES salary_detail_type(salary_detail_type_id),
                               Operation tinyint(3)
);
CREATE TABLE salary_detail_type (
                                    salary_detail_type_id INT(10) PRIMARY KEY not null ,
                                    salary_detail_type_name VARCHAR(10),
                                    creat_at datetime,
                                    update_at datetime
);
INSERT INTO salary_detail_type (salary_detail_type_id, salary_detail_type_name, creat_at, update_at)
VALUES
    (1, 'Lương cứng', NOW(), NOW()),
    (2, 'Phụ cấp', NOW(), NOW()),
    (3, 'Thưởng', NOW(), NOW()),
    (4, 'Thuế TNCN', NOW(), NOW()),
    (5, 'BHXH', NOW(), NOW());
/*cau1
a)Get lương tháng 5 của 1 user bất kì.
b) Get danh sách lương tháng 5 của 1 phòng bất kì sắp xếp theo tổng
lương giảm dần
c) Get nhưng user bị tính lương sai(total_salary != total detail salary) trong tháng 5/2020
d) Get tổng chi phí của các phòng trong tháng 5/2020
 */
SELECT s.total_salary
FROM salary s
         JOIN salary_detail sd ON s.salary_id = sd.salary_id
         JOIN salary_detail_type sdt ON sd.salary_detail_type_id = sdt.salary_detail_type_id
         JOIN user_role ur ON s.user_role_id = ur.user_role_id
         JOIN user_department ud ON ur.user_department_id = ud.user_department_id
         JOIN Users u ON u.user_id = ud.user_id
WHERE u.user_id = 1 AND s.salary_month = '05';
/*cau2
  Get danh sách lương tháng 5 của 1 phòng bất kì sắp xếp theo tổng lương giảm dần
 */
SELECT u.user_id, u.first_name, u.last_name, s.total_salary
FROM Users u
         JOIN user_department ud ON u.user_id = ud.user_id
         JOIN user_role ur ON ud.user_department_id = ur.user_department_id
         JOIN salary s ON ur.user_role_id = s.user_role_id
WHERE ud.department_id = 4
  AND s.salary_month = '05'
ORDER BY s.total_salary DESC;
/*cau3 Get nhung user bị tính lương sai(total_salary != total detail salary) trong tháng 5/2023 */
SELECT u.user_id, u.first_name, u.last_name, s.total_salary, SUM(sd.amount) AS total_detail_salary
FROM Users u
         JOIN user_department ud ON u.user_id = ud.user_id
         JOIN user_role ur ON ud.user_department_id = ur.user_department_id
         JOIN salary s ON ur.user_role_id = s.user_role_id
         JOIN salary_detail sd ON s.salary_id = sd.salary_id
WHERE s.salary_month = '5' AND s.salary_year = '2023'
GROUP BY u.user_id, s.total_salary
HAVING s.total_salary != total_detail_salary;
/*cau 4 Get tổng chi phí của các phòng trong tháng 5/2023 */
SELECT d.department_id, d.department_name, SUM(s.total_salary) AS total_cost
FROM Departments d
         JOIN user_department ud ON d.department_id = ud.department_id
         JOIN user_role ur ON ud.user_department_id = ur.user_department_id
         JOIN salary s ON ur.user_role_id = s.user_role_id
WHERE s.salary_month = '5' AND s.salary_year = '2023'
GROUP BY d.department_id, d.department_name;


/*cau 3 Viết thủ tục cho phép get chi tiết lương tháng của 1 user bất kì
  hiển thị thông tin sau: Type, Amount, Operation; sao cho hàng cuối cùng sẽ là cột tổng*/

/*ERROR*/
drop procedure cau3a;
CREATE PROCEDURE cau3a(IN user_department_id INT)
BEGIN
    DECLARE user_total_salary DECIMAL(12, 2);

    -- Lấy tổng lương của user trong tháng 5
    SELECT SUM(S.total_salary) INTO user_total_salary
    FROM Salary S
             JOIN user_role UR ON S.user_role_id = UR.user_role_id
    WHERE UR.user_department_id = user_department_id
      AND S.salary_month = '05';

    -- Lấy chi tiết lương của user trong tháng 5
    SELECT
        sdt.salary_detail_type_name AS Type,
        sd.amount AS Amount,
        CASE sd.Operation
            WHEN 1 THEN 'Cộng'
            WHEN 2 THEN 'Trừ'
            WHEN 3 THEN 'Nhân'
            WHEN 4 THEN 'Chia'
            ELSE 'Không xác định'
            END AS Operation
    FROM salary s
            JOIN Salary_detail sd ON s.salary_id = sd.salary_id
            JOIN Salary_detail_type sdt ON sd.salary_detail_type_id = sdt.salary_detail_type_id
            JOIN user_role ur ON s.user_role_id = ur.user_role_id
    WHERE ur.user_department_id = user_department_id
      AND s.salary_month = '05'
    ORDER BY sd.salary_detail_type_id ASC;

    -- Hiển thị tổng lương của user trong tháng 5
    SELECT 'Tổng' AS Type, user_total_salary AS Amount, '' AS Operation;
END ;
call cau3(2);
/*cau 4  Viết thủ tục cho phép get lương tháng của 1 user bất kì hiển thị thông tin sau:
     fullname (first_name + last_name), department, role, salary */
drop procedure cau4c;
CREATE PROCEDURE cau4c(IN user_department_id INT)
BEGIN
    DECLARE user_fullname VARCHAR(255);
    DECLARE user_department VARCHAR(255);
    DECLARE user_role VARCHAR(255);
    DECLARE user_salary DECIMAL(12, 2);

    -- Lấy fullname của user
    SELECT CONCAT(first_name, ' ', last_name) INTO user_fullname
    FROM Users
    WHERE user_id = (
        SELECT user_id
        FROM user_department
        WHERE user_department_id = user_department_id
        LIMIT 1
    );
    -- Lấy thông tin phòng ban của user
    SELECT department_name INTO user_department
    FROM Departments
    WHERE department_id = user_department_id;
    -- Lấy thông tin role của user
    SELECT role_name INTO user_role
    FROM Role
    WHERE role_id = (
        SELECT role_id
        FROM user_role
        WHERE user_department_id = user_department_id
        LIMIT 1
    );
    -- Lấy thông tin lương của user trong tháng hiện tại (tháng 5 năm 2023)
    SELECT total_salary INTO user_salary
    FROM Salary
    WHERE user_role_id = (
        SELECT user_role_id
        FROM user_role
        WHERE user_department_id = user_department_id
        LIMIT 1
    )
      AND salary_month = '05'
      AND salary_year = '2023';
    -- Hiển thị thông tinn
    SELECT user_fullname AS fullname, user_department AS department, user_role AS role, user_salary AS salary;
END;
call cau4c(1);
/*cau 5 Viết trigger cho phép khi insert data role của 1 user trong phòng thì khoảng thời gian các role phải khác nhau và nằm
  trong khoảng thời gian của user nằm trong phòng đó.
Ví dụ: user A nằm thuộc phòng Admin từ 1/4/2020 đến 1/8/2020, user A có role Nhân viên từ 1/4/2020-1/6/2020 thì
  khi user đó lên trưởng phòng Admin thì phải nằm trong khoảng 1/4/2020-1/8/2020 và khác khoảng 1/4/2020 và 1/6/2020.*/
drop trigger cau5;
CREATE TRIGGER cau5
    BEFORE INSERT ON user_role
    FOR EACH ROW
BEGIN
    DECLARE existing_role_start_date DATE;
    DECLARE existing_role_end_date DATE;
    DECLARE new_role_start_date DATE;
    DECLARE new_role_end_date DATE;
    -- Lấy thông tin về khoảng thời gian của các vai trò hiện tại của người dùng trong phòng
    SELECT start_date, end_date
    INTO existing_role_start_date, existing_role_end_date
    FROM user_role
    WHERE user_department_id = NEW.user_department_id
    ORDER BY start_date DESC
    LIMIT 1;
    -- Lấy thông tin về khoảng thời gian của vai trò mới
    SET new_role_start_date = NEW.start_date;
    SET new_role_end_date = NEW.end_date;
    -- Kiểm tra xem khoảng thời gian của vai trò mới có hợp lệ hay không
    IF (new_role_start_date < existing_role_start_date AND new_role_end_date > existing_role_start_date) OR
       (new_role_start_date < existing_role_end_date AND new_role_end_date > existing_role_end_date) OR
       (new_role_start_date >= existing_role_start_date AND new_role_end_date <= existing_role_end_date) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Khoảng thời gian của vai trò mới không hợp lệ.';
    END IF;
END;
INSERT INTO user_role (user_role_id,user_department_id, role_id, start_date, end_date, created_at, updated_at)
VALUES (14,1, 1, '2023-04-01', '2023-06-01', NOW(), NOW());


