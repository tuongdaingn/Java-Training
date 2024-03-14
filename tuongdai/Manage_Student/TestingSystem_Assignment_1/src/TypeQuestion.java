public class TypeQuestion {

    int TypeID;
    String TypeName;

    public TypeQuestion(int typeID, String typeName) {
        TypeID = typeID;
        TypeName = typeName;
    }

    public int getTypeID() {
        return TypeID;
    }

    public void setTypeID(int typeID) {
        TypeID = typeID;
    }

    public String getTypeName() {
        return TypeName;
    }

    public void setTypeName(String typeName) {
        TypeName = typeName;
    }

    @Override
    public String toString() {
        return "TypeQuestion{" +
                "TypeID=" + TypeID +
                ", TypeName='" + TypeName + '\'' +
                '}';
    }
}
