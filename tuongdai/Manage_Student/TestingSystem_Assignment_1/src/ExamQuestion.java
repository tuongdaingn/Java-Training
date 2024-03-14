public class ExamQuestion {

    Exam ExamID;
    Question QuestionID;

    public ExamQuestion(Exam examID, Question questionID) {
        ExamID = examID;
        QuestionID = questionID;
    }

    public Exam getExamID() {
        return ExamID;
    }

    public void setExamID(Exam examID) {
        ExamID = examID;
    }

    public Question getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(Question questionID) {
        QuestionID = questionID;
    }

    @Override
    public String toString() {
        return "ExamQuestion{" +
                "ExamID=" + ExamID +
                ", QuestionID=" + QuestionID +
                '}';
    }
}
