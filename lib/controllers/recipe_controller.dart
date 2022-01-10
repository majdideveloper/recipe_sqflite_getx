


import 'package:get/state_manager.dart';
import 'package:recipe_sqflite_getx/db/db_helper.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';

class RecipeController extends GetxController{
   RxList<Recipe> recipeList = <Recipe>[].obs;

  
   Future<int> addRecipe({ required Recipe recipe}) {
    return DBHelper.insertInDB(recipe);
  }

   Future<void> getRecipe()async {
   List<Map<String, dynamic>> recipes= await DBHelper.queryFromDB();
   recipeList.assignAll(recipes.map((data) => Recipe.fromJson(data)).toList());
   
  }

}