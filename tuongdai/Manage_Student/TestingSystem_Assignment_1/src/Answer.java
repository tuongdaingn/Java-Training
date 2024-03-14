public class Answer {

    int AnswerID;
    String Content;
    Question QuestionID;
    String isCorrect;

    public Answer(int answerID, String content, Question questionID, String isCorrect) {
        AnswerID = answerID;
        Content = content;
        QuestionID = questionID;
        this.isCorrect = isCorrect;
    }

    public int getAnswerID() {
        return AnswerID;
    }

    public void setAnswerID(int answerID) {
        AnswerID = answerID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Question getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(Question questionID) {
        QuestionID = questionID;
    }

    public String isCorrect() {
        return isCorrect;
    }

    public void setCorrect(String correct) {
        isCorrect = correct;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "AnswerID=" + AnswerID +
                ", Content='" + Content + '\'' +
                ", QuestionID=" + QuestionID +
                ", isCorrect='" + isCorrect + '\'' +
                '}';
    }
}
