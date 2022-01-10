import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/config/app_router.dart';
import 'package:recipe_sqflite_getx/config/size_config.dart';
import 'package:recipe_sqflite_getx/controllers/recipe_controller.dart';

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
                onPressed: () {
                  Get.toNamed(Routes.addRecipeScreen);
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx((){
          return ListView.separated(
              itemBuilder: (context, index) {
                var recipe = _recipeController.recipeList[index];
        
                return SizedBox(
                  height: SizeConfig.screenHeight / 2.5,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.black,
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                          child: Center(
                              child: Text(
                            recipe.title!,
                            style: const TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.w500),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: _recipeController.recipeList.length);
        }
          
        ),
      ),
    );
  }
}
