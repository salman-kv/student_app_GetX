import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';
import 'package:student_app_getx/model/student_model.dart';
import 'package:student_app_getx/view/widget/notification.dart';

class EditPage extends StatelessWidget {
  final StudentModel data;
  EditPage({super.key, required this.data});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _place = TextEditingController();
  final TextEditingController _std = TextEditingController();
  final _nameKey = GlobalKey<FormFieldState>();
  final _ageKey = GlobalKey<FormFieldState>();
  final _placeKey = GlobalKey<FormFieldState>();
  final _stdKey = GlobalKey<FormFieldState>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mycontroller = Get.find<MyController>();
    mycontroller.imagePick.value = data.image;
    _name.text = data.name;
    _age.text = data.age.toString();
    _place.text = data.place;
    _std.text = data.std.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit student deatails',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                ' Name ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                key: _nameKey,
                validator: (value) {
                  if ((!RegExp(r'^\S+(?!\d+$)').hasMatch(value!))) {
                    return 'enter valid catogory';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _nameKey.currentState!.validate();
                },
                controller: _name,
                decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Age ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                key: _ageKey,
                validator: (value) {
                  if ((!RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(value!))) {
                    return 'enter valid amount';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _ageKey.currentState!.validate();
                },
                controller: _age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Place ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                key: _placeKey,
                validator: (value) {
                  if ((!RegExp(r'^\S+(?!\d+$)').hasMatch(value!))) {
                    return 'enter valid catogory';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _placeKey.currentState!.validate();
                },
                controller: _place,
                decoration: InputDecoration(
                    hintText: 'Place',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                ' Standard ',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextFormField(
                key: _stdKey,
                validator: (value) {
                  if ((!RegExp(r'^[0-9]+\.?[0-9]*$').hasMatch(value!))) {
                    return 'enter valid amount';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  _stdKey.currentState!.validate();
                },
                controller: _std,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Standard',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              // getbuilder
              GetBuilder<MyController>(
                builder: (data) {
                  return Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: data.imagePick.value == ''
                          ? const Text('Pls Select image')
                          : Image.file(File(data.imagePick.value)),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      mycontroller.imagePickFunctionForGetBuilder();
                    },
                    child: const Text('select image')),
              )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    if (mycontroller.imagePick.value == '') {
                      errorSnackBar(context, 'pls add image');
                      _formkey.currentState!.validate();
                      return;
                    }
                    if (_formkey.currentState!.validate()) {
                      StudentModel val = StudentModel(
                        id: data.id,
                        name: _name.text,
                        age: int.parse(_age.text),
                        place: _place.text,
                        std: int.parse(_std.text),
                        image: mycontroller.imagePick.value,
                      );
                      mycontroller.addData(val);
                      Get.back();
                      successSnackBar(context, 'Data update successfully');
                    }
                  },
                  child: const Text('SUBMIT')),
            ],
          ),
        ),
      ),
    );
  }
}
