USE Testing_System_Assignment_1;


/*JOIN*/


select * from Account;
select * from Department;
/*cau1 Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ*/
select * from Account ;
select Account.AccountID,Account.Email,Account.Username,Department.DepartmentName,Account.PositionID,Account.CreateDate
from Account
join Department on Department.DepartmentID = Account.DepartmentID;
/*cau2 Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 */
select Account.AccountID,Account.Email,Account.Username,Department.DepartmentName,Account.PositionID,Account.CreateDate
from Account
join Department  on Account.DepartmentID = Department.DepartmentID
where CreateDate >'2010/12/29';
/*cau 3 Viết lệnh để lấy ra tất cả các developer */
select Account.AccountID,Account.Email,Account.Username,Department.DepartmentName,Account.PositionID,Account.CreateDate
from Account
join Department  on Account.DepartmentID = Department.DepartmentID
where DepartmentName='Development department';
/*cau 4 Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên */
select * from Account;
select * from Department;

select DepartmentName
from Department
join Account on Department.DepartmentID = Account.DepartmentID
group by Account.DepartmentID
having count(Username) > 3;
/*cau 5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất*/
/*CHUA HOAN THANH*/
select Question.Content , COUNT(*) AS SOLUONG
from Question
INNER JOIN ExamQuestion on Question.QuestionID = ExamQuestion.QuestionID
GROUP BY Question.Content
ORDER BY SOLUONG ASC
LIMIT 1;
/*cau 6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question*/
SELECT CategoryQuestion.CategoryName,COUNT(*) AS SO_QUESTION
FROM CategoryQuestion
INNER JOIN Question on CategoryQuestion.CategoryID = Question.CategoryID
GROUP BY CategoryQuestion.CategoryName
ORDER BY SO_QUESTION DESC ;
/*cau 7 Thông kê mỗi Question được sử dụng trong bao nhiêu Exam*/
SELECT Question.Content, count(ExamQuestion.ExamID) AS SO_LUONG
FROM Question
left join ExamQuestion on Question.QuestionID = ExamQuestion.QuestionID
group by Question.Content,Question.QuestionID;

/*cau 8 Lấy ra Question có nhiều câu trả lời nhất*/
SELECT Question.Content
from Question
left join Answer on Question.QuestionID = Answer.QuestionID
group by Answer.QuestionID
order by count(*) asc
limit 1;
/*cau 9 Thống kê số lượng account trong mỗi group*/
SELECT Groupp.GroupName, COUNT(GroupAccount.AccountID) AS so_luong_account
FROM Groupp
         LEFT JOIN GroupAccount ON Groupp.GroupID = GroupAccount.GroupID
GROUP BY Groupp.GroupName, Groupp.GroupID;
/*cau 10  Tìm chức vụ có ít người nhất*/
SELECT Position.PositionName,COUNT(*) AS SO_LUONG
FROM Position
         JOIN Account  on Position.PositionID = Account.PositionID
GROUP BY Position.PositionName
ORDER BY SO_LUONG ASC
LIMIT 1;
/*cau 11 Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM*/
SELECT Position.PositionName,COUNT(*) AS SO_LUONG
FROM Position
         JOIN Account  on Position.PositionID = Account.PositionID
GROUP BY Position.PositionName
ORDER BY SO_LUONG ASC;
/*cau 12 Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...*/
SELECT  TypeQuestion.TypeName,CategoryQuestion.CategoryName,Question.Content,Answer.Content
FROM Question
inner join Answer on Question.QuestionID = Answer.QuestionID
inner join TypeQuestion  on Question.TypeID = TypeQuestion.TypeID
inner join CategoryQuestion  on Question.CategoryID = CategoryQuestion.CategoryID;
/*cau13 Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm*/
SELECT TypeQuestion.TypeName, COUNT(*) AS SO_LUONG_CAU_HOI
FROM TypeQuestion
LEFT JOIN Question on TypeQuestion.TypeID = Question.TypeID
GROUP BY TypeQuestion.TypeName
ORDER BY SO_LUONG_CAU_HOI DESC ;
/*cau14 Lấy ra group không có account nào*/
SELECT Groupp.GroupName
from Groupp
left join GroupAccount on GroupAccount.GroupID = Groupp.GroupID
WHERE GroupAccount.GroupID IS NULL;
/*cau15 Lấy ra group không có account nào*/
/*cau16 Lấy ra question không có answer nào*/
SELECT Question.Content
FROM Question
LEFT JOIN Answer on Question.QuestionID = Answer.QuestionID
WHERE Answer.AnswerID IS NULL ;


/*UNION*/


/*CAU17
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhaU
 */
SELECT * FROM Account
INNER JOIN GroupAccount on Account.AccountID = GroupAccount.AccountID
WHERE GroupID=1;
SELECT * FROM Account
INNER JOIN GroupAccount on Account.AccountID = GroupAccount.AccountID
WHERE GroupID=2;

SELECT * FROM Account
INNER JOIN GroupAccount on Account.AccountID = GroupAccount.AccountID
WHERE GroupID=1
UNION
SELECT * FROM Account
INNER JOIN GroupAccount on Account.AccountID = GroupAccount.AccountID
WHERE GroupID=2;
/*CAU18
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)
 */
SELECT *
FROM Groupp
WHERE GroupID IN (
    SELECT  GroupID
    FROM GroupAccount
    GROUP BY GroupID
    HAVING COUNT(*) >1
    );
SELECT *
FROM Groupp
WHERE GroupID IN (
    SELECT  GroupID
    FROM GroupAccount
    GROUP BY GroupID
    HAVING COUNT(*) <2
);
SELECT *
FROM Groupp
WHERE GroupID IN (
    SELECT  GroupID
    FROM GroupAccount
    GROUP BY GroupID
    HAVING COUNT(*) >1
)
union
SELECT *
FROM Groupp
WHERE GroupID IN (
    SELECT  GroupID
    FROM GroupAccount
    GROUP BY GroupID
    HAVING COUNT(*) <2
);


/*VIEW*/
/*CAU1:Tạo view có chứa danh sách nhân viên thuộc phòng ban sale*/
select * from Account;
select * from Department;
drop view view_name_SALE;
CREATE VIEW view_name_SALE AS
SELECT Account.Username
FROM Account
         INNER JOIN Department on Account.DepartmentID = Department.DepartmentID
WHERE Department.DepartmentName = 'Sale';
select * from view_name_SALE;
/*Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất*/
drop view view_Cau2;
CREATE VIEW view_Cau2 AS
    SELECT AccountID, Email, Username, DepartmentID, PositionID, CreateDate
        FROM Account
            INNER JOIN GroupAccount ON GroupAccount.AccountID=Account.AccountID;
/*Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
được coi là quá dài) và xóa nó đi*/
SELECT * FROM Question;
DROP VIEW VIEW_CAU3;
CREATE VIEW VIEW_CAU3 AS
    SELECT * FROM Question
        WHERE LENGTH(Content) > 18;
SELECT * FROM VIEW_CAU3;
DELETE FROM VIEW_CAU3;
/*Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất*/

DROP VIEW VIEW_CAU4;
CREATE VIEW VIEW_CAU4 AS
    SELECT DepartmenT.DepartmentName,COUNT(Account.AccountID) AS SL_Nhanvien
    FROM Department
    INNER JOIN Account on Department.DepartmentID = Account.DepartmentID
    GROUP BY Department.DepartmentID
    HAVING COUNT(Account.AccountID) = (
        SELECT COUNT(Account.AccountID) AS max_nhan_vien
        FROM Department
                 INNER JOIN Account ON Department.DepartmentID = Account.DepartmentID
        GROUP BY Department.DepartmentID
        ORDER BY max_nhan_vien DESC
        LIMIT 1);
SELECT * FROM VIEW_CAU4;
/*5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo*/
/*CHUA HOAN THANH*/
CREATE VIEW VIEW_CAU5 AS
    SELECT Question.Content
    FROM Question
    INNER JOIN Account ON Question.QuestionID=Account.
CREATE VIEW NguyenQuestions AS
SELECT q.*
FROM questions q
         JOIN accounts a ON q.user_id = a.user_id
WHERE a.last_name = 'Nguyễn';



/*STORE*/



USE
/*Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó*/
DROP PROCEDURE GetAccountsByDepartment_Q1;
CREATE PROCEDURE GetAccountsByDepartment_Q1(
    IN department_name NVARCHAR(255)
)
BEGIN
    SELECT * FROM Account
    INNER JOIN Department ON Account.DepartmentID = Department.DepartmentID
    WHERE Department.DepartmentName = department_name;
END;

CALL GetAccountsByDepartment_Q1 ('Maketing');
/*Question 2: Tạo store để in ra số lượng account trong mỗi group*/
DROP PROCEDURE CountAccountsByGroup_Q2;
CREATE PROCEDURE CountAccountsByGroup_Q2(
)
    BEGIN
        SELECT Groupp.GroupName, COUNT(GroupAccount.AccountID) as number_account
            FROM Groupp
                LEFT JOIN GroupAccount on Groupp.GroupID=GroupAccount.GroupID
        GROUP BY Groupp.GroupID;
    END;
CALL CountAccountsByGroup_Q2();


/*Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại*/
DROP PROCEDURE  CountQuestionsByType;
CREATE PROCEDURE CountQuestionsByType()
BEGIN
    DECLARE Present_month DATE;
    SET Present_month = DATE_FORMAT(NOW(), '%Y-%m-01');

    SELECT TypeQuestion.TypeName,count(Question.TypeID) as number_question
        FROM TypeQuestion
            left join Question on  TypeQuestion.TypeID= Question.TypeID
    WHERE YEAR(Question.CreateDate) = YEAR(Present_month)
      AND MONTH(Question.CreateDate) = MONTH(Present_month)
    GROUP BY TypeQuestion.TypeID;
END;

CALL CountQuestionsByType();

/*Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất*/
drop PROCEDURE MostFrequentQuestionType;
CREATE PROCEDURE MostFrequentQuestionType()
BEGIN
    SELECT TypeID
        FROM(
            SELECT TypeID,COUNT(*) AS NUMBER_QUESTION
            FROM Question
            group by TypeID
            order by NUMBER_QUESTION desc
            limit 1
            )
        AS most_frequent_type;
end;
CALL MostFrequentQuestionType();

/* Question 5: Sử dụng store ở question 4 để tìm ra tên của type question*/
DROP PROCEDURE GetQuestionTypeNameById;
CREATE PROCEDURE GetQuestionTypeNameById(IN type_id INT)
BEGIN
    SELECT TypeName
    FROM TypeQuestion
    WHERE type_id = TypeID;
END;

CALL GetQuestionTypeNameById(2);

/*Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa
 chuoi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào*/
DROP PROCEDURE SearchGroupOrUser;
CREATE PROCEDURE SearchGroupOrUser(
IN  SEARCH_STRING VARCHAR(255)
)
BEGIN
    DECLARE group_found INT DEFAULT 0;
    SELECT * FROM Groupp
        WHERE GroupName LIKE CONCAT('%',SEARCH_STRING,'%');
    IF group_found =0  THEN
    SELECT * FROM Account
        WHERE UserName LIKE CONCAT('%',SEARCH_STRING,'%');
    END IF;
END;

CALL SearchGroupOrUser('nh');

/*Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán:
username sẽ giống email nhưng bỏ phần @..mail đi positionID: sẽ có default là developer departmentID: sẽ được cho vào 1 phòng chờ
Sau đó in ra kết quả tạo thành công*/

/*Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất*/
DROP PROCEDURE LongestQuestionByType;

CREATE PROCEDURE LongestQuestionByType( IN QUESTION_TYPE VARCHAR(255))
BEGIN
    DECLARE MAX_LENGTH INT;
    SELECT MAX(LENGTH(content)) INTO MAX_LENGTH
    FROM Question
    INNER JOIN TypeQuestion on TypeQuestion.TypeID=Question.TypeID
    WHERE QUESTION_TYPE=TypeQuestion.TypeName;
    SELECT * FROM Question
        INNER JOIN TypeQuestion on TypeQuestion.TypeID=Question.TypeID
    WHERE TypeQuestion.TypeName = QUESTION_TYPE AND LENGTH(Question.content) = MAX_LENGTH;
END;

CALL LongestQuestionByType('Essay');
CALL LongestQuestionByType('Multiple-Choice');

/*Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID*/
drop procedure DeleteExamByID;
CREATE PROCEDURE DeleteExamByID(IN import_ID int)
BEGIN
       DELETE  FROM Exam WHERE ExamID=import_ID;
end;

CALL DeleteExamByID(11);


CREATE PROCEDURE DeleteAccountByID(IN import_ID int)
BEGIN
    DELETE  FROM Account WHERE AccountID=import_ID;
end;

CALL DeleteAccountByID(12);


CREATE PROCEDURE DeleteGroupAccountByID(IN import_ID int)
BEGIN
    DELETE  FROM GroupAccount WHERE GroupID=import_ID;
end;

CALL DeleteGroupAccountByID(5);


/*Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
Sau đó in số lượng record đã remove từ các table liên quan trong khi removing*/
-- Sử dụng stored procedure DeleteExamByID để xóa exam có ExamID là 11


/*Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào
tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc*/
DROP PROCEDURE DeleteDepartment;
CREATE PROCEDURE DeleteDepartment(IN department_name VARCHAR(255))
BEGIN
    DECLARE default_department_id INT;

    -- Tìm ID của phòng ban mặc định (chờ việc)
    SELECT DepartmentID INTO default_department_id
    FROM Department
    WHERE DepartmentName = 'Chờ việc';

    -- Cập nhật ID của phòng ban của các tài khoản thuộc phòng ban cần xóa về phòng ban mặc định
    UPDATE Account
    SET DepartmentID = default_department_id
    WHERE DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = department_name);

    -- Xóa phòng ban được chỉ định
    DELETE FROM Department WHERE DepartmentName = department_name;
END ;
CALL DeleteDepartment('BaoVe');


/*Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay*/
DROP PROCEDURE CountQuestionsPerMonth;
CREATE PROCEDURE CountQuestionsPerMonth()
BEGIN
    DECLARE current_year INT;
    SET current_year = YEAR(NOW());

    SELECT
        MONTH(CreateDate) AS month,
        COUNT(*) AS num_questions
    FROM Question
    WHERE YEAR(CreateDate) = current_year
    GROUP BY MONTH(CreateDate);
END;
CALL CountQuestionsPerMonth();




/*Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")*/








/*Trigger*/





/*Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước*/
CREATE TRIGGER before_group_insert
    BEFORE INSERT ON Groupp
    FOR EACH ROW
BEGIN
    DECLARE current_year INT;
    DECLARE group_year INT;

    SET current_year = YEAR(NOW());
    SET group_year = YEAR(NEW.CreateDate);

    IF group_year < current_year - 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể chèn Group có ngày tạo trước 1 năm trước.';
    END IF;
END;

INSERT INTO `Groupp` (GroupName,CreatorID, CreateDate) VALUES ('nhom 1','3','2022-01-30');

/*Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào department "Sale" nữa,
    khi thêm thì hiện ra thông báo "Department "Sale" cannot add more user"*/

CREATE TRIGGER prevent_account_add_to_sale
    BEFORE INSERT ON Account
    FOR EACH ROW
BEGIN
    DECLARE department_name VARCHAR(255);
    DECLARE error_message VARCHAR(255);

    -- Lấy tên phòng ban mà người dùng đang cố gắng thêm vào
    SELECT DepartmentName INTO department_name
    FROM Department
    WHERE DepartmentID = NEW.DepartmentID;

    -- Kiểm tra nếu phòng ban là "Sale" thì phát sinh lỗi
    IF department_name = 'Sale' THEN
        SET error_message = 'Không thể thêm tài khoản vào phòng ban "Sale".';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;
END;
INSERT INTO Account (Email,UserName,DepartmentID,PositionID,CreateDate)
VALUES ('cogiaothanh@gmail.com','Nguyen Thanh Thao',1,2,'2024-01-19');


/*Question 3: Cấu hình 1 group có nhiều nhất là 5 user*/
DROP TRIGGER check_user_limit;
CREATE TRIGGER check_user_limit
    BEFORE INSERT ON GroupAccount
    FOR EACH ROW
BEGIN
    DECLARE user_count INT;

    -- Lấy số lượng user trong group của user mới được thêm
    SELECT COUNT(*) INTO user_count
    FROM GroupAccount
    WHERE GroupID = NEW.GroupID;

    -- Kiểm tra nếu số lượng user trong group vượt quá 5 thì phát sinh lỗi
    IF user_count >=5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Group đã đạt đến số lượng người dùng tối đa (5).';
    END IF;
END;
INSERT INTO GroupAccount (GroupID,AccountID)
VALUES (5,11);


/*Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question*/
drop trigger check_question_limit;
CREATE TRIGGER check_question_limit
    BEFORE INSERT ON ExamQuestion
    FOR EACH ROW
BEGIN
    DECLARE question_count INT;

    -- Lấy số lượng câu hỏi trong bài thi
    SELECT COUNT(QuestionID) INTO question_count
    FROM ExamQuestion
    WHERE ExamID = NEW.ExamID;

    -- Kiểm tra nếu số lượng câu hỏi trong bài thi vượt quá 4 thì phát sinh lỗi
    IF question_count >= 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bài thi đã đạt đến số lượng câu hỏi tối đa (4).';
    END IF;
END;
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (2,11);

/*Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
    còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó*/
drop trigger prevent_delete_admin;
CREATE TRIGGER prevent_delete_admin
    BEFORE DELETE ON Account
    FOR EACH ROW
BEGIN
    -- Kiểm tra nếu email của tài khoản bị xóa là "admin@gmail.com" thì không cho phép xóa
    IF OLD.Email = 'admin@gmail.com' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản admin.';
    ELSE
        -- Xóa thông tin liên quan đến tài khoản đó trong bảng GroupAccount
        DELETE FROM GroupAccount WHERE AccountID = OLD.AccountID;

        -- Xóa tài khoản trong bảng Account
        DELETE FROM Account WHERE AccountID = OLD.AccountID;
    END IF;
END;

-- Thực hiện xóa tài khoản
DELETE FROM Account WHERE Email = 'admin@gmail.com';

/*Question 6: Không sử dụng cấu hình default cho field DepartmentID của table Account,
    hãy tạo trigger cho phép người dùng khi tạo account không điền vào departmentID
    thì sẽ được phân vào phòng ban "waiting Department"*/

CREATE TRIGGER set_default_department
    BEFORE INSERT ON Account
    FOR EACH ROW
BEGIN
    -- Khai báo biến
    DECLARE waiting_department_id INT;

    -- Tìm ID của phòng ban "waiting Department"
    SELECT DepartmentID INTO waiting_department_id FROM Department WHERE DepartmentName = 'Chờ việc';

    -- Gán giá trị mặc định cho DepartmentID
    SET NEW.DepartmentID = waiting_department_id;
END;
INSERT INTO Account (Email,UserName,PositionID,CreateDate)
VALUES ('john.doe@example.com','jhondoe',1, '2022-1-30');

/*Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi question,
    trong đó có tối đa 2 đáp án đúng.*/
/*Question 8: Viết trigger sửa lại dữ liệu cho đúng:
Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database*/
/*Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày*/
drop trigger prevent_delete_test;
DELETE FROM Exam WHERE ExamID = 13;  -- Sẽ không xóa được vì bài thi này mới được tạo trong vòng 2 ngày
/*Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question đó chưa nằm trong
  exam nào*/

CREATE TRIGGER prevent_update_delete_question
    BEFORE UPDATE ON Question
    FOR EACH ROW
BEGIN
    DECLARE exam_count INT;

    -- Đếm số lượng bài kiểm tra chứa câu hỏi cần được cập nhật
    SELECT COUNT(*) INTO exam_count FROM ExamQuestion WHERE JSON_CONTAINS(QuestionID, JSON_ARRAY(NEW.QuestionID)) = 1;

    -- Nếu câu hỏi đã được sử dụng trong ít nhất một bài kiểm tra, không cho phép cập nhật
    IF exam_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Không được phép cập nhật câu hỏi đã được sử dụng trong bài kiểm tra.';
    END IF;
END;



DELETE FROM Question WHERE QuestionID = 2;
UPDATE Question SET Content = 'Câu hỏi đã sửa đổi' WHERE QuestionID = 14; -- Sửa đổi một câu hỏi

/*Question 12: Lấy ra thông tin exam trong đó:Duration <= 30 thì sẽ đổi thành giá trị "Short time"30 < Duration <= 60
  thì sẽ đổi thành giá trị "Medium time" Duration > 60 thì sẽ đổi thành giá trị "Long time"*/

/*Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên là the_number_user_amount và
  mang giá trị được quy định như sau:
  Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
  Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
  Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
 */
/*Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào
  không có user thì sẽ thay đổi giá trị 0 thành "Không có User"*/
CREATE TRIGGER update_department_user_count
    AFTER INSERT ON Account
    FOR EACH ROW
BEGIN
    DECLARE department_user_count INT;

    -- Đếm số lượng user trong phòng ban
    SELECT COUNT(*) INTO department_user_count
    FROM Account
    WHERE DepartmentID = NEW.DepartmentID;

    -- Cập nhật số lượng user cho phòng ban
    UPDATE Department
    SET UserCount = IF(department_user_count > 0, department_user_count, 'Không có User')
    WHERE DepartmentID = NEW.DepartmentID;
END;
















