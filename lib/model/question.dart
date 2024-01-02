class QuestionList {
  final String question;
  final int correctAnswerIndex;

  final List<String> options;

  QuestionList(
      {required this.question,
      required this.options,
      required this.correctAnswerIndex});
}

List<QuestionList> questions = [
  QuestionList(
    question: 'masum',
    correctAnswerIndex: 1,
    options: [
      'a) madina',
      'b) madina',
      'c) madina',
      'd) madina',
    ],
  ),
  QuestionList(
    question: 'question',
    correctAnswerIndex: 1,
    options: [
      'a) madina',
      'b) madina',
      'c) madina',
      'd) madina',
    ],
  ),
  QuestionList(
    question: 'question',
    correctAnswerIndex: 1,
    options: [
      'a) madina',
      'b) madina',
      'c) madina',
      'd) madina',
    ],
  ),
  QuestionList(
    question: 'question',
    correctAnswerIndex: 1,
    options: [
      'a) madina',
      'b) madina',
      'c) madina',
      'd) madina',
    ],
  ),
  QuestionList(
    question: 'question',
    correctAnswerIndex: 1,
    options: [
      'a) madina',
      'b) madina',
      'c) madina',
      'd) madina',
    ],
  ),
];
