import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';

Widget searhBox() {
  TextEditingController _searchKey=TextEditingController();
  var mycontroll = Get.find<MyController>();
  return SearchBar(
    controller: _searchKey,
    hintText: 'Search',
    leading: const Icon(Icons.search),
    trailing: [
      IconButton(
          onPressed: () {
            mycontroll.refreshingStudentDetails();
          },
          icon: const Icon(Icons.close))
    ],
    onChanged: (value) {
      if (value.isEmpty) {
        _searchKey.text='';
        mycontroll.refreshingStudentDetails();
      } else {
        mycontroll.searchData(value);
      }
    },
  );
}
