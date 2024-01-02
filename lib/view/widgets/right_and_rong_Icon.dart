
import 'package:flutter/material.dart';

Widget buildCorrectIcon()=> const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(
    Icons.check,
    color: Colors.white,
  ),
);

Widget buildWrongIcon()=> const CircleAvatar(
  radius: 15,
  backgroundColor: Colors.green,
  child: Icon(
    Icons.close,
    color: Colors.red,
  ),
);