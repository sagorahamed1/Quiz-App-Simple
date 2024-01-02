import 'package:flutter/material.dart';

import '../../utils/color.dart';
import 'right_and_rong_Icon.dart';

class AnswerCard extends StatelessWidget {
  final String question;
  final bool isSelected;
  final int? currentIndex;
  final int? correctAnswerIndex;
  final int? selectedAnswer;

  const AnswerCard({
    Key? key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: selectedAnswer != null
          ? Container(
        height: 70,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
            color: isCorrectAnswer
                ? AppColors.myGreen
                : isWrongAnswer
                ? AppColors.myRed
                : AppColors.myGray,
          ),
        ),
            child:  Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 16,color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                isCorrectAnswer
                ?buildCorrectIcon()
                    :isWrongAnswer
                ?buildWrongIcon()
                    :SizedBox.shrink()
              ],
            ),
      )
          : Container(
        height: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey)
              ),
              child:  Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        question,
                        style: TextStyle(fontSize: 16,color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    ); // You might want to return an empty container or null for unselected state
  }
}

