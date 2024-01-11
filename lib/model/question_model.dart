  class QuestionModel {
    final String question;
    final int correctAnswerIndex;

    final List<String> options;

    QuestionModel(
        {required this.question,
        required this.options,
        required this.correctAnswerIndex});
}
