public class CategoryQuestion {

    int CategoryID;
    String CategoryName;

    public CategoryQuestion(int categoryID, String categoryName) {
        CategoryID = categoryID;
        CategoryName = categoryName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int categoryID) {
        CategoryID = categoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        CategoryName = categoryName;
    }

    @Override
    public String toString() {
        return "CategoryQuestion{" +
                "CategoryID=" + CategoryID +
                ", CategoryName='" + CategoryName + '\'' +
                '}';
    }
}
