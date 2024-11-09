import 'package:flutter/material.dart';
import 'package:main_exam_task_sample/controller/home_Screen_controller.dart';
import 'package:main_exam_task_sample/controller/products_details_screen_controller.dart';
import 'package:main_exam_task_sample/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsDetailsScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
