import 'package:get/state_manager.dart';
import 'package:recipe_sqflite_getx/db/db_helper.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';

class RecipeController extends GetxController {
  RxList<Recipe> recipeList = <Recipe>[].obs;

  Future<int> addRecipe({required Recipe recipe}) {
    return DBHelper.insertInDB(recipe);
  }

  Future<void> getRecipe() async {
    List<Map<String, dynamic>> recipes = await DBHelper.queryFromDB();
    recipeList.assignAll(recipes.map((data) => Recipe.fromJson(data)).toList());
  }

  void deleteRecipe(Recipe recipe) async {
    await DBHelper.deleteFromDB(recipe);
    getRecipe();
  }

  Future<void> editRecipe(
      {required Recipe recipe,
      required String title,
      required String description,
      required String imageUrl,
      required String recipetext}) async {
    await DBHelper.updateInDB(recipe, title, description, imageUrl, recipetext);
    getRecipe();
  }
}
