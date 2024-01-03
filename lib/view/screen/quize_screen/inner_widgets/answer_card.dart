import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/color.dart';
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
        height: 70.h,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
           color: isCorrectAnswer
               ? AppColors.myGreen.withAlpha(70)
               : isWrongAnswer
               ? AppColors.myRed.withAlpha(70)
               : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2.w,
            color: isCorrectAnswer
                ? AppColors.myGreen.withAlpha(50)
                : isWrongAnswer
                ? AppColors.myRed.withAlpha(50)
                : AppColors.myGray,
          ),
        ),
            child:  Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 16,color: Colors.black),
                    ),
                  ),
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
        height: 70.h,
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey)
              ),
              child:  Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        question,
                        style: TextStyle(fontSize: 16,color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

