import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/model/student_model.dart';
import 'package:student_app_getx/view/pages/edit_page.dart';
import 'package:student_app_getx/view/pages/show_deatails.dart';
import 'package:student_app_getx/view/widget/notification.dart';

Widget singleStudentShow(BuildContext context, StudentModel data) {
  return GestureDetector(
    onTap: () {
      Get.to(ShowStudent(studentModel: data));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 70,
            backgroundImage: FileImage(
              File(data.image),
            ),
          ),
          Text(
            data.name,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22,fontWeight: FontWeight.bold),
          ),
          Text(
            data.std.toString(),
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(EditPage(data: data,));
                },
                icon: const Icon(
                  Icons.edit,
                  size: 35,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              IconButton(
                onPressed: () {
                  deleteAlert(context, data.id);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
