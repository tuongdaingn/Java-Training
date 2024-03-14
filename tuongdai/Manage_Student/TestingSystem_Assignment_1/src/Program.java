import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;

public class Program {

    public static void main(String[] args) {

        // Khởi tạo đối tượng cho bảng Department
        Department department1 = new Department(1, "Sale" );
        Department department2 = new Department(2, "Marketing" );
        Department department3 = new Department(3, "Tech" );
        Department department4 = new Department(4, "IT");

        // Khởi tạo đối tượng cho bảng Position
        Position position1 = new Position(1, "Test");
        Position position2 = new Position(2, "PM");
        Position position3 = new Position(3, "Dev");

        // Khởi tạo đối tượng cho bảng Account
        Account account1 = new Account(1, "dai@gmail.com", "tuongdai", "Tuong Dai", department1, position1, LocalDate.of(2021, 2, 1));
        Account account2 = new Account(2, "vinh@gmail.com", "danhhiep", "Danh Hiep", department2, position2, LocalDate.of(2021, 2, 1));
        Account account3 = new Account(3, "vinh@gmail.com", "danhvinh", "Danh Vinh", department3, position3, LocalDate.of(2021, 2,1));

        // Khởi tạo đối tượng cho bảng Group
        Group group1 = new Group(1, "Java Fresher", 1, LocalDate.of(2023, 1, 1));
        Group group2 = new Group(2, "C# Fresher", 2, LocalDate.of(2023, 6,15));
        Group group3 = new Group(3, "PHP Fresher", 3, LocalDate.of(2022, 1, 26));

        // Khởi tạo đối tượng cho bảng GroupAccount
        GroupAccount groupAccount1 = new GroupAccount(group1, account2, LocalDate.of(2023, 1, 2));
        GroupAccount groupAccount2 = new GroupAccount(group2, account1, LocalDate.of(2023, 6, 20));
        GroupAccount groupAccount3 = new GroupAccount(group3, account3, LocalDate.of(22, 5, 22));

        // Khởi tạo đối tượng cho bảng TypeQuestion
        TypeQuestion typeQuestion1 = new TypeQuestion(1, "Essay");
        TypeQuestion typeQuestion2 = new TypeQuestion(2, "Multi-choice");

        // Khởi tạo đối tượng cho bảng CategoryQuestion
        CategoryQuestion categoryQuestion1 = new CategoryQuestion(1, "Java");
        CategoryQuestion categoryQuestion2 = new CategoryQuestion(2, "PHP");
        CategoryQuestion categoryQuestion3 = new CategoryQuestion(3, "Javascript");

        // Khởi tạo đối tượng cho bảng Question
        Question question1 = new Question(1, "OOP là gì?", categoryQuestion1, typeQuestion1, 2, LocalDate.of(2020, 1, 14));
        Question question2 = new Question(2, "Echo là gì?", categoryQuestion2, typeQuestion2, 1, LocalDate.of(2020, 1, 15));
        Question question3 = new Question(3, "Javascript là gì?", categoryQuestion3, typeQuestion2, 3, LocalDate.of(2020, 1,16));

        //Khởi tạo đối tượng cho bảng Answer
        Answer answer1 = new Answer(1, "Là lập trình hướng đối tượng", question1, "Đúng");
        Answer answer2 = new Answer(2, "Không biết", question2, "Sai");
        Answer answer3 = new Answer(2, "Là một ngôn ngữ lập trình", question3, "Đúng");

        // Khởi tạo đối tượng cho bảng Exam

        Exam exam1 = new Exam(1, "111", "Test1", categoryQuestion1, "90 phút", 1, LocalDate.of(2023, 7, 15));
        Exam exam2 = new Exam(2, "112", "Test2", categoryQuestion2, "60 phút", 2, LocalDate.of(2023, 8, 15));
        Exam exam3 = new Exam(3, "113", "Test3", categoryQuestion3, "45 phút", 1, LocalDate.of(2023, 9, 15));

        // Khởi tạo đối tuợng cho bảng ExamQuestion
        ExamQuestion examQuestion1 = new ExamQuestion(exam1, question1);
        ExamQuestion examQuestion2 = new ExamQuestion(exam2, question2);
        ExamQuestion examQuestion3 = new ExamQuestion(exam3, question3);

        // In thông tin của các đối tượng đã tạo
        System.out.println("Thông tin của Department:");
        System.out.println(department1);

        System.out.println(account1);

        System.out.printf(String.valueOf(typeQuestion1));


        System.out.println();
        System.out.println("==============================================================");

        // Question 1:
        //Kiểm tra account thứ 2
        //Nếu không có phòng ban (tức là department == null) thì sẽ in ra text
        //"Nhân viên này chưa có phòng ban"
        //Nếu không thì sẽ in ra text "Phòng ban của nhân viên này là …"


        System.out.println("Question 1:");
        if (account2.getDepartmentID() == null ) {

            System.out.printf("Nhân viên chưa có phòng ban");
        } else {
            System.out.println("Phòng ban của nhân viên này là: " + account2.getDepartmentID().getDepartmentName());

        }

        System.out.println();
        System.out.println("==============================================================");

        /*Question 2:
        Kiểm tra account thứ 2
        Nếu không có group thì sẽ in ra text "Nhân viên này chưa có group"
        Nếu có mặt trong 1 hoặc 2 group thì sẽ in ra text "Group của nhân viên
        này là Java Fresher, C# Fresher"
        Nếu có mặt trong 3 Group thì sẽ in ra text "Nhân viên này là người
        quan trọng, tham gia nhiều group"
        Nếu có mặt trong 4 group trở lên thì sẽ in ra text "Nhân viên này là
        người hóng chuyện, tham gia tất cả các group"*/
        System.out.println("Question 2:");




        System.out.println();
        System.out.println("==============================================================");

        /*Question 3:
        Sử dụng toán tử ternary để làm Question 1*/
        System.out.println("Question 3:");
        String message = (account2 == null) ? "Nhân viên này chưa có phòng ban" : "Phòng ban của nhân viên này là " + department2;
        System.out.println(message);

        System.out.println();
        System.out.println("==============================================================");

        /*Question 4:
        Sử dụng toán tử ternary để làm yêu cầu sau:
        Kiểm tra Position của account thứ 1
        Nếu Position = Dev thì in ra text "Đây là Developer"
        Nếu không phải thì in ra text "Người này không phải là Developer"*/
        System.out.println("Question 4:");

        System.out.println();
        System.out.println("==============================================================");

        /*Question 5:
        Lấy ra số lượng account trong nhóm thứ 1 và in ra theo format sau:
        Nếu số lượng account = 1 thì in ra "Nhóm có một thành viên"
        Nếu số lượng account = 2 thì in ra "Nhóm có hai thành viên"
        Nếu số lượng account = 3 thì in ra "Nhóm có ba thành viên"
        Còn lại in ra "Nhóm có nhiều thành viên"*/
        System.out.println("Question 5:");

                int soLuongAccount = 1;

                switch (soLuongAccount) {
                    case 1:
                        System.out.println("Nhóm có một thành viên");
                        break;
                    case 2:
                        System.out.println("Nhóm có hai thành viên");
                        break;
                    case 3:
                        System.out.println("Nhóm có ba thành viên");
                        break;
                    default:
                        System.out.println("Nhóm có nhiều thành viên");
                        break;
                }


        System.out.println();
        System.out.println("==============================================================");

        /*Question 6:
        Sử dụng switch case để làm lại Question 2*/
        System.out.println("Question 6:");

        int soLuongGroup = 1;

        switch (soLuongGroup) {
            case 0:
                System.out.println("Nhân viên này chưa có group");
                break;
            case 1:
            case 2:
                System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
                break;
            case 3:
                System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
                break;
            default:
                System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
                break;
        }

        System.out.println();
        System.out.println("==============================================================");

        /*Question 8:
        In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ*/
        System.out.println("Question 8:");


        


    }
}

