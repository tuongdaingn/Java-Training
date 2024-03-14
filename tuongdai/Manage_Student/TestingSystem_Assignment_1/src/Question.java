import java.time.LocalDate;
import java.util.Date;

public class Question {

    int QuestionID;
    String Content;
    CategoryQuestion CategoryID;
    TypeQuestion TypeID;
    int CreatorID;
    LocalDate CreateDate;

    public Question(int questionID, String content, CategoryQuestion categoryID, TypeQuestion typeID, int creatorID, LocalDate createDate) {
        QuestionID = questionID;
        Content = content;
        CategoryID = categoryID;
        TypeID = typeID;
        CreatorID = creatorID;
        CreateDate = createDate;
    }

    public int getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(int questionID) {
        QuestionID = questionID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public CategoryQuestion getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(CategoryQuestion categoryID) {
        CategoryID = categoryID;
    }

    public TypeQuestion getTypeID() {
        return TypeID;
    }

    public void setTypeID(TypeQuestion typeID) {
        TypeID = typeID;
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
        return "Question{" +
                "QuestionID=" + QuestionID +
                ", Content='" + Content + '\'' +
                ", CategoryID=" + CategoryID +
                ", TypeID=" + TypeID +
                ", CreatorID=" + CreatorID +
                ", CreateDate=" + CreateDate +
                '}';
    }
}
