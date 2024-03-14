public class Position {

    int PositionID;
    String PositionName;

    public Position(int positionID, String positionName) {
        PositionID = positionID;
        PositionName = positionName;
    }

    public int getPositionID() {
        return PositionID;
    }

    public void setPositionID(int positionID) {
        PositionID = positionID;
    }

    public String getPositionName() {
        return PositionName;
    }

    public void setPositionName(String positionName) {
        PositionName = positionName;
    }

    @Override
    public String toString() {
        return "Position{" +
                "PositionID=" + PositionID +
                ", PositionName='" + PositionName + '\'' +
                '}';
    }
}
