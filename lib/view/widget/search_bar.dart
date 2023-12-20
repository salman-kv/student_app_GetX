import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';

Widget searhBox() {
  TextEditingController _searchKey = TextEditingController();
  var mycontroll = Get.find<MyController>();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SearchBar(
      controller: _searchKey,
      hintText: 'Search',
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
            onPressed: () {
              mycontroll.refreshingStudentDetails();
              _searchKey.text = '';
            },
            icon: const Icon(Icons.close))
      ],
      onChanged: (value) {
        if (value.isEmpty) {
          mycontroll.refreshingStudentDetails();
        } else {
          mycontroll.searchData(value);
        }
      },
    ),
  );
}
