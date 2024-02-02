create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;
drop table Department;
create table Department
(
    DepartmentID int PRIMARY KEY auto_increment,
    DepartmentName varchar(255) not null
);
INSERT INTO Department(DepartmentName)
VALUES
    ('Sale'),
    ('Maketing'),
    ('Front Office'),
    ('Financial'),
    ('Development department')
;
select * from Department;

drop table Position;
create table Position
(
    PositionID int PRIMARY KEY auto_increment,
    PositionName varchar(255) not null
);
INSERT INTO Position(PositionName)
VALUES
    ('Dev'),
    ('Test'),
    ('Scrum Master'),
    ('Pm'),
    ('Po')
;
drop table Account;
create table Account
(
    AccountID int PRIMARY KEY auto_increment,
    Email varchar(255) not null ,
    Username varchar(255) not null ,
    DepartmentID varchar(35),
    PositionID varchar(35),
    CreateDate date
    /*foreign key (DepartmentID) references Department(DepartmentID)*/
    /*foreign key (PositionID) references Position(PositionID)*/
);

DROP TABLE Groupp;
create table Groupp
(
    GroupID int PRIMARY KEY auto_increment,
    GroupName varchar(255) NOT NULL,
    CreatorID VARCHAR(255) NOT NULL,
    CreateDate date
    /*foreign key (AccountID) references Account(AccountID)*/

);
DROP TABLE GroupAccount;
create table GroupAccount
(
    GroupID varchar(35)  NOT NULL,
    AccountID varchar(35) NOT NULL,
    JoinDate date
);
DROP TABLE TypeQuestion;
create table TypeQuestion
(
    TypeID int PRIMARY KEY auto_increment,
    TypeName varchar(255) not null
);
DROP TABLE CategoryQuestion;
create table CategoryQuestion
(
    CategoryID int PRIMARY KEY auto_increment,
    CategoryName varchar(255) not null
);
DROP TABLE Question;
create table Question
(
    QuestionID int PRIMARY KEY auto_increment,
    Content varchar(255) NOT NULL,
    CategoryID varchar(35) NOT NULL,
    TypeID varchar(35) NOT NULL,
    CreatorID varchar(35) NOT NULL,
    CreateDate date
);
DROP TABLE Answer;
create table Answer
(
    AnswerID int PRIMARY KEY auto_increment,
    Content varchar(255) NOT NULL,
    QuestionID varchar(255) NOT NULL,
    isCorrect BOOLEAN
);
DROP TABLE Exam;
create table Exam
(
    ExamID int PRIMARY KEY auto_increment,
    Code varchar(35) NOT NULL,
    Title varchar(35) NOT NULL,
    CategoryID varchar(35) NOT NULL,
    Duration time,
    CreatorID varchar(35) NOT NULL,
    CreateDate DATE
);
DROP TABLE ExamQuestion;
create table ExamQuestion
(
    ExamID varchar(35) NOT NULL,
    QuestionID varchar(35) NOT NULL
);


/*CAU 2 lấy ra tất cả các phòng ban*/
select DepartmentName from Department;
/*CAU 3 lấy ra id của phòng ban "Sale"*/
select DepartmentID from  Department
where DepartmentName ='Sale';
/*CAU 4  lấy ra thông tin account có full name dài nhất*/
select * from Account;
select * from  Account
order by length(Username) DESC
limit 1;
/*CAU 5  Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id=3*/
select * from Account;
select * from  Account
where DepartmentID = 3
order by length(Username) DESC
limit 1;
/*CAU 6 Lấy ra tên group đã tham gia trước ngày 20/12/2019*/
/*
select * from Groupp
where not exists(
    select * from Groupp
    where CreateDate between '2019-12-10' and '2024-29-1'
    );
select * from Groupp
WHERE CreateDate NOT BETWEEN '2019-12-10' and '2024-29-1';*/
select * from Groupp;
select  GroupName from Groupp
where CreateDate not between '2019-12-10' and '2025-1-1';
select GroupName  from Groupp
where CreateDate < '2019-12-20';

/*cau 7 Lấy ra ID của question có >= 4 câu trả lời*/

select QuestionID from Answer
group by QuestionID
having count(*) >= 4;

/*CAU8 Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
20/12/2019*/
select * from Exam;
select Code from Exam
where Duration >= 60 AND CreateDate < '2019-12-20';
/*CAU9 Lấy ra 5 group được tạo gần đây nhất*/
select GroupName from Groupp
order by CreateDate desc
limit 5;
/*CAU10 Đếm số nhân viên thuộc department có id = 2*/
select * from  Department;
select * from Account;
select count(*) FROM Account
WHERE DepartmentID = 2;

/*cau11 Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"*/
SELECT * FROM Account WHERE Account.Username like 'D%o';
/*Cau 12 Xóa tất cả các exam được tạo trước ngày 20/12/2019 */
delete from Exam
where CreateDate NOT BETWEEN '2019-12-10' and '2025-1-1';
delete from Exam
where CreateDate < '2019-12-10';
select * from Exam;
/*Cau 13 Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"*/
delete from Question
where Question.Content like 'câu hỏi%';
select * from Question;
/*Cau 14 Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
email thành loc.nguyenba@vti.com.vn*/
select * from Account;
update Account
set Username = 'Nguyen Ba Loc',Email = 'nguyenba@vti.com.vn'
where AccountID=4;
/*update account có id = 5 sẽ thuộc group có id = 4*/
SELECT * FROM Account;
SELECT * FROM Groupp;
SELECT * FROM GroupAccount;
update GroupAccount
set GroupID = 4
WHERE AccountID = 5;