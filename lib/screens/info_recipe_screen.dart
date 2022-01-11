import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_sqflite_getx/config/size_config.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';

class InfoRecipeScreen extends StatelessWidget {
  InfoRecipeScreen({Key? key, required this.recipe}) : super(key: key);
  Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Info Recipe',
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 2,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
                child: Image.network(
                  recipe.imageUrl!,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title!,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    recipe.description!,
                     style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
           const SizedBox(height: 10.0,),
                  Text(
                    recipe.recipe!,
                     style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
