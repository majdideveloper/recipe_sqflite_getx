import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/screens/add_recipe.dart';
import 'package:recipe_sqflite_getx/screens/home_screen.dart';

class AppRouters {
//initialRoute

  static const homeScreen = Routes.homeScreen;

  // getPages

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () =>  HomeScreen(),
    ),
    GetPage(
      name: Routes.addRecipeScreen,
      page: () =>  AddRecipeScreen(),
    ),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
  static const addRecipeScreen = '/addRecipeScreen';

}
