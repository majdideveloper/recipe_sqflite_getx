import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/controllers/recipe_controller.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';
import 'package:recipe_sqflite_getx/widgets/custom_text_field.dart';

class AddRecipeScreen extends StatefulWidget {
  AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final RecipeController _recipeController = Get.put(RecipeController());

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _imageUrlController = TextEditingController();

  final TextEditingController _recipeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Recipe',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  label: 'title',
                  multiLines: false,
                  controller: _titleController,
                ),
                CustomTextField(
                  label: 'description',
                  multiLines: false,
                  controller: _descriptionController,
                ),
                CustomTextField(
                  label: 'imageurl',
                  multiLines: false,
                  controller: _imageUrlController,
                ),
                CustomTextField(
                  label: 'recipe',
                  maxLines: 8,
                  multiLines: true,
                  controller: _recipeTextController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _validateRecipe,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Add Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addRecipeToDB() async {
    int value = await _recipeController.addRecipe(
      recipe: Recipe(
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        recipe: _recipeTextController.text,
      ),
    );
    debugPrint(value.toString());
  }

  _validateRecipe() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _recipeTextController.text.isNotEmpty &&
        _imageUrlController.text.isNotEmpty) {
      _addRecipeToDB();
      Get.back();
    } else if (_titleController.text.isEmpty||
    _descriptionController.text.isEmpty ||
        _recipeTextController.text.isEmpty ||
        _imageUrlController.text.isEmpty) {
      debugPrint('in snakBar........');
      setState(() {
        Get.snackbar(
          'required',
          'All field are required',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      });
    } else {
      print('################### error in validator ############');
    }
  }
}
