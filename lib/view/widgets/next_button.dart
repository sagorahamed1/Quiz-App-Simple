import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RactangularButton extends StatelessWidget {
  final VoidCallback? onPresed;
  final String label;

  const RactangularButton(
      {
        super.key,
        required this.onPresed,
        required this.label
      });



  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPresed,
        child: SizedBox(
          height: 50.h,
          width: 200.w,
          child: Card(
            color: onPresed != null ? Colors.green : Colors.amber,
            child: Center(
              child: Text(label,style: TextStyle(letterSpacing: 2,fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
        )

    );
  }
}
