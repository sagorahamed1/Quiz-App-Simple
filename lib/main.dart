import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quize/view/screen/fl_chart.dart';

import 'view/screen/pie_chart.dart';
import 'view/screen/quize_screen.dart';
import 'view/screen/splash_screen.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizeScreen(),
    );
  }
}
