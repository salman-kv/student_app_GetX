import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  final mycontroll=Get.find<MyController>();

  @override
  Widget build(BuildContext context) {
    mycontroll.splashScreen();
    mycontroll.refreshingStudentDetails();
    return const Scaffold(
      body: Center(
        child: Text('splashing'),
      ),
    );
  }
}