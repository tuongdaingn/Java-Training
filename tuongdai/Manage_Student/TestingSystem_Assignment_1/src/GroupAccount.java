import java.time.LocalDate;
import java.util.Date;

public class GroupAccount {

    Group GroupID;
    Account AccountID;
    LocalDate JoinDate;

    public GroupAccount(Group groupID, Account accountID, LocalDate joinDate) {
        GroupID = groupID;
        AccountID = accountID;
        JoinDate = joinDate;
    }

    public Group getGroupID() {
        return GroupID;
    }

    public void setGroupID(Group groupID) {
        GroupID = groupID;
    }

    public Account getAccountID() {
        return AccountID;
    }

    public void setAccountID(Account accountID) {
        AccountID = accountID;
    }

    public LocalDate getJoinDate() {
        return JoinDate;
    }

    public void setJoinDate(LocalDate joinDate) {
        JoinDate = joinDate;
    }

    @Override
    public String toString() {
        return "GroupAccount{" +
                "GroupID=" + GroupID +
                ", AccountID=" + AccountID +
                ", JoinDate=" + JoinDate +
                '}';
    }
}
