import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controller/mycontroll.dart';
import 'package:student_app_getx/view/pages/add_page.dart';
import 'package:student_app_getx/view/widget/search_bar.dart';
import 'package:student_app_getx/view/widget/student_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
           searhBox(),
            Expanded(
              child: GetX<MyController>(
                init: Get.find<MyController>(),
                builder: (controller) {
                  return GridView.count(
                    physics: const ScrollPhysics(),
                    crossAxisCount: 2,
                    children: List.generate(
                      controller.studentDetails.length,
                      (index) => singleStudentShow(
                          context, controller.studentDetails[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddPage());
          },
          child:const Text('add'),
        ),
      ),
    );
  }
}
