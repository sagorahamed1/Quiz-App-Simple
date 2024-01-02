import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quize/utils/color.dart';
import 'package:get/get.dart';

import 'fl_chart.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
     Timer(Duration(seconds:2), () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyFiChart()));
       // Get.to(HomeScreen());
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
             color: MyColors.spLass,
             child: Center(
               child: Image.asset('assets/splass_icon.png')),
             ),
           );

  }
}
