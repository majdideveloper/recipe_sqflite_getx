import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/config/app_router.dart';
import 'package:recipe_sqflite_getx/config/size_config.dart';
import 'package:recipe_sqflite_getx/controllers/recipe_controller.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';
import 'package:recipe_sqflite_getx/screens/add_recipe.dart';
import 'package:recipe_sqflite_getx/screens/info_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeController _recipeController = Get.put(RecipeController());

  @override
  void initState() {
    super.initState();
    _recipeController.getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var listrecipe = _recipeController.recipeList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Recipe App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () async {
                  await Get.toNamed(Routes.addRecipeScreen);
                  _recipeController.getRecipe();
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context, index) {
                var recipe = _recipeController.recipeList[index];

                return GestureDetector(
                  onTap: (){Get.to(InfoRecipeScreen(recipe: recipe,) );},
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    onDismissed: (dismissDirection) {
                      _recipeController.deleteRecipe(recipe);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.grey[300],
                      child: SizedBox(
                        height: SizeConfig.screenHeight / 2.5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(40))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: Image.network(
                                     recipe.imageUrl!,
                                    // 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(
                                    child: Text(
                                  recipe.title!,
                                  style: const TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: _recipeController.recipeList.length);
        }),
      ),
    );
  }
}
