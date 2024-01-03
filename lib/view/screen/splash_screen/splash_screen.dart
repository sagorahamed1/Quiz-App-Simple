import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/utils/color.dart';
import '../quize_screen/quize_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
   initState() {
    super.initState();
     Timer(const Duration(seconds: 2), () {
       Get.to(const QuizeScreen());
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
             child: Center(
               child: CircularProgressIndicator(color: Colors.redAccent,)
             ),
             ),
           );

  }
}
