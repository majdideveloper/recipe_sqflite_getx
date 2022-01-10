import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/config/app_router.dart';
import 'package:recipe_sqflite_getx/config/theme.dart';
import 'package:recipe_sqflite_getx/screens/home_screen.dart';

import 'db/db_helper.dart';

void main()async {

 WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: Themes.themeAppBar,
      ),
      getPages: AppRouters.routes,
      home:  HomeScreen(),
    );
  }
}
