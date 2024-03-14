import java.time.LocalDate;
import java.util.Date;

public class Account {

    int AccountID;
    String Email;
    String UserName;
    String FullName;
    Department DepartmentID;
    Position PositionID;
    LocalDate CreateDate;


    public Account(int accountID, String email, String userName, String fullName, Department departmentID, Position positionID, LocalDate createDate) {
        AccountID = accountID;
        Email = email;
        UserName = userName;
        FullName = fullName;
        DepartmentID = departmentID;
        PositionID = positionID;
        CreateDate = createDate;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int accountID) {
        AccountID = accountID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String fullName) {
        FullName = fullName;
    }

    public Department getDepartmentID() {
        return DepartmentID;
    }

    public void setDepartmentID(Department departmentID) {
        DepartmentID = departmentID;
    }

    public Position getPositionID() {
        return PositionID;
    }

    public void setPositionID(Position positionID) {
        PositionID = positionID;
    }

    public LocalDate getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDate createDate) {
        CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Account{" +
                "AccountID=" + AccountID +
                ", Email='" + Email + '\'' +
                ", UserName='" + UserName + '\'' +
                ", FullName='" + FullName + '\'' +
                ", DepartmentID=" + DepartmentID.getDepartmentID() +
                ", PositionID=" + PositionID.getPositionID() +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
