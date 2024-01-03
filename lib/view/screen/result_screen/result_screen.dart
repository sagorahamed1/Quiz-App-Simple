import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quize/utils/color.dart';
import 'package:quize/view/screen/quize_screen/quize_screen.dart';

import '../../../model/questions.dart';
import '../../widgets/next_button.dart';

class ResultScreen extends StatelessWidget {

  final int score;
  const ResultScreen({super.key,required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text('Your Score',style: TextStyle(
              fontSize: 34.h,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
            SizedBox(
              height: 100,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    value: score/9,
                    color: Colors.green,
                    backgroundColor: Colors.red,
                  ),
                ),
                Column(
                  children: [
                    Text(score.toString() + '/9',style: TextStyle(fontSize: 80,color: Colors.black),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${(score / questions.length*100).round()}%',style: TextStyle(fontSize: 30,color: AppColors.myNavi),)
                  ],
                )
              ],
            ),
            SizedBox(
              height: 150,
            ),
            RactangularButton(
              onPresed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> QuizeScreen()));
              },
              label: 'Restart',
            )
          ],
        ),
      ),
    );
  }
}
