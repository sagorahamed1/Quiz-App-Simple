import 'package:flutter/material.dart';
import 'package:quize/model/question.dart';

import '../widgets/answer_card.dart';

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key});

  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  int? selectedAnswer;
  int questionIndex =0;
  int score =0;


  void pickAnswer (int value){
    setState(() {
      selectedAnswer=value;
      final question = questions[questionIndex];

      bool isLastQuestion = questionIndex ==questions.length-1;
      if(selectedAnswer == question.correctAnswerIndex){
        score ++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[0];
    return Scaffold(
      appBar: AppBar(title: Text('Quize'),),
      body: Column(
        children: [
          Text(question.question),
          ListView.builder(
            shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: selectedAnswer == null
                  ? () => pickAnswer(index)
                    :null,
                  child: AnswerCard(
                    currentIndex:index,
                    question: question.options[index],
                    isSelected:selectedAnswer ==index,
                    selectedAnswer:selectedAnswer,
                    correctAnswerIndex:question.correctAnswerIndex
                  ),
                );
              }

          )

        ],
      ),
    );
  }
}
