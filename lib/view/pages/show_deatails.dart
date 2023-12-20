import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_app_getx/model/student_model.dart';

class ShowStudent extends StatelessWidget {
  final StudentModel studentModel;
  const ShowStudent({super.key,required this.studentModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 227, 188),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width/1.5,
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                  image: DecorationImage(image:FileImage(File(studentModel.image)),fit:BoxFit.cover),
                  borderRadius: BorderRadius.circular(1000)
                ),
              ),
              const SizedBox(height: 10,),
              Text('NAME : ${studentModel.name}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('AGE : ${studentModel.age}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('STANDERD : ${studentModel.std}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 10,),
              Text('PLACE : ${studentModel.place}',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            ],
          ),
        ),
      ),
    );
  }
}