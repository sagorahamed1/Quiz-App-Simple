import 'package:flutter/material.dart';

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
          height: 50,
          width: 200,
          child: Card(
            color: onPresed != null ? Colors.orange : Colors.amber,
            child: Center(
              child: Text(label,style: TextStyle(letterSpacing: 2,fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
          ),
        )

    );
  }
}
