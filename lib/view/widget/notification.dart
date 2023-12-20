import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';

errorSnackBar(BuildContext context, String data) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(data),
      // margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      // width: 20,
    ),
  );
}

successSnackBar(BuildContext context, String data) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(data),
      // margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(255, 7, 151, 48),
      // width: 20,
    ),
  );
}

deleteAlert(BuildContext context, String id) {
  var mycontcroller=Get.find<MyController>();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Do you want to delete the item'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('NO')),
          ElevatedButton(
              onPressed: () {
                mycontcroller.deleteData(id);
                Navigator.of(context).pop();
                errorSnackBar(context, 'Data deleted');
              },
              child: const Text('YES')),
        ],
      );
    },
  );
}
