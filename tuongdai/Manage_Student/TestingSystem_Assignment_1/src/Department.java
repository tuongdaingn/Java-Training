public class Department {
    int DepartmentID;
    String DepartmentName;

    public Department(int departmentID, String departmentName) {
        DepartmentID = departmentID;
        DepartmentName = departmentName;
    }

    public int getDepartmentID() {
        return DepartmentID;
    }

    public void setDepartmentID(int departmentID) {
        DepartmentID = departmentID;
    }

    public String getDepartmentName() {
        return DepartmentName;
    }

    public void setDepartmentName(String departmentName) {
        DepartmentName = departmentName;
    }

    @Override
    public String toString() {
        return "Department{" + "DepartmentID=" + DepartmentID + ", DepartmentName='" + DepartmentName + '\'' + '}';
    }


}

