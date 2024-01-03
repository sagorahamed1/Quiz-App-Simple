import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quize/view/screen/result_screen/result_screen.dart';

import '../../../model/questions.dart';
import 'inner_widgets/answer_card.dart';
import '../../widgets/next_button.dart';

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



  int _secondsRemaining = 20;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        goToNextQuestion();
        _secondsRemaining = 20;
        startTimer();
        timer.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    print("-----------------------------------sagor");
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'Quize',
          style: TextStyle(color: Colors.black),
        ),actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black)
            ),
            child: Center(child: Text("${_secondsRemaining}")),
          )
      ],
        centerTitle: true,
        // backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                margin: EdgeInsets.all(10),
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.purple,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                                      question.question,
                                      style: TextStyle(color: Colors.black,fontSize: 20),
                                    ),
                    ))),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 370.h,

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
                  onPresed: selectedAnswer != null ? goToNextQuestion : goToNextQuestion,
                  label: selectedAnswer != null ?  'Next' : "Skip",
                )
        ],
      ),
    );
  }
}
