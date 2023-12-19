import 'dart:async';

import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/model/student_model.dart';
import 'package:student_app_getx/view/pages/home_page.dart';

class MyController extends GetxController {
  // db name
  String studentDb = "student_db";

  // obserable list for student deatails variable
  RxList<StudentModel> studentDetails = <StudentModel>[].obs;

  // image picker obserable variable
  RxString imagePick = ''.obs;


  // splash timer setting

  void splashScreen() {
    Timer(const Duration(milliseconds: 1500), () {
      Get.off(const HomePage());
    });
  }


  // image selecting using obx

  imagePickFunction() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagePick.value = image!.path;
  }


  // image selcting ising getbuildet

  imagePickFunctionForGetBuilder() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    imagePick.value = image!.path;
    update();
  }


  //add data on db

  Future<void> addData(StudentModel studentModel) async {
    var db = await Hive.openBox<StudentModel>(studentDb);
    await db.put(studentModel.id, studentModel);
    refreshingStudentDetails();
  }


  // delete data from db

  Future<void> deleteData(String id) async {
    var db = await Hive.openBox<StudentModel>(studentDb);
    db.delete(id);
    refreshingStudentDetails();
  }


  //refresh student deatails

  refreshingStudentDetails() async {
    studentDetails.clear();
    var db = await Hive.openBox<StudentModel>(studentDb);
    List<StudentModel> val = db.values.toList();
    for (StudentModel i in val) {
      studentDetails.add(i);
    }
  }
  

  // serach age

  searchData(String data) async {
    await refreshingStudentDetails();
    List<StudentModel> temp=[];
    temp.addAll(studentDetails);
    studentDetails.clear();
    for (var element in temp) {
      if(element.name.contains(data)){
        studentDetails.add(element);
      }
    }
  }
}
