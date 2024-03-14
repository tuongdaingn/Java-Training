import java.time.LocalDate;
import java.util.Date;

public class Group {

    int GroupID;
    String GroupName;
    int CreatorID;
    LocalDate CreateDate;

    public Group(int groupID, String groupName, int creatorID, LocalDate createDate) {
        GroupID = groupID;
        GroupName = groupName;
        CreatorID = creatorID;
        CreateDate = createDate;
    }

    public int getGroupID() {
        return GroupID;
    }

    public void setGroupID(int groupID) {
        GroupID = groupID;
    }

    public String getGroupName() {
        return GroupName;
    }

    public void setGroupName(String groupName) {
        GroupName = groupName;
    }

    public int getCreatorID() {
        return CreatorID;
    }

    public void setCreatorID(int creatorID) {
        CreatorID = creatorID;
    }

    public LocalDate getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDate createDate) {
        CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Group{" +
                "GroupID=" + GroupID +
                ", GroupName='" + GroupName + '\'' +
                ", CreatorID=" + CreatorID +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
