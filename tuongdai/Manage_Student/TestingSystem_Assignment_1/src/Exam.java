import java.sql.Time;
import java.time.LocalDate;
import java.util.Date;

public class Exam {

    int ExamID;
    String Code;
    String Title;
    CategoryQuestion CategoryID;
    String Duration;
    int CreatorID;
    LocalDate CreateDate;

    public Exam(int examID, String code, String title, CategoryQuestion categoryID, String duration, int creatorID, LocalDate createDate) {
        ExamID = examID;
        Code = code;
        Title = title;
        CategoryID = categoryID;
        Duration = duration;
        CreatorID = creatorID;
        CreateDate = createDate;
    }

    public int getExamID() {
        return ExamID;
    }

    public void setExamID(int examID) {
        ExamID = examID;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public CategoryQuestion getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(CategoryQuestion categoryID) {
        CategoryID = categoryID;
    }

    public String getDuration() {
        return Duration;
    }

    public void setDuration(String duration) {
        Duration = duration;
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
        return "Exam{" +
                "ExamID=" + ExamID +
                ", Code='" + Code + '\'' +
                ", Title='" + Title + '\'' +
                ", CategoryID=" + CategoryID +
                ", Duration='" + Duration + '\'' +
                ", CreatorID=" + CreatorID +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
