import 'package:flutter/material.dart';
import 'package:quize/view/screen/result_screen.dart';

import '../../controller/question_controller.dart';
import '../widgets/answer_card.dart';
import '../widgets/next_button.dart';

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int? selectedAnswer;
  int questionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswer = value;
      final question = questions[questionIndex];

      if (selectedAnswer == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        selectedAnswer = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'BdQuize',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                  child: Text(
                question.question,
                style: TextStyle(color: Colors.white),
              ))),
          Container(
            margin: EdgeInsets.all(20),
            height: 400,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: selectedAnswer == null
                          ? () => pickAnswer(index)
                          : null,
                      child: AnswerCard(
                          currentIndex: index,
                          question: question.options[index],
                          isSelected: selectedAnswer == index,
                          selectedAnswer: selectedAnswer,
                          correctAnswerIndex: question.correctAnswerIndex),
                    );
                  }),
            ),
          ),
          isLastQuestion
              ? RactangularButton(
                  onPresed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => ResultScreen(score: score)));
                  },
                  label: 'Finish',
                )
              : RactangularButton(
                  onPresed: selectedAnswer != null ? goToNextQuestion : null,
                  label: 'Next',
                )
        ],
      ),
    );
  }
}
