import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app_getx/controller/mycontroll.dart';
import 'package:student_app_getx/model/student_model.dart';
import 'package:student_app_getx/view/pages/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final mycontcroller=Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          color: Colors.amber
        )
      ),
      home: SplashScreen() ,
    );
  }
}