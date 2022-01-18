
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/config/size_config.dart';
import 'package:recipe_sqflite_getx/controllers/recipe_controller.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';
import 'package:recipe_sqflite_getx/widgets/custom_text_field.dart';

class InfoRecipeScreen extends StatefulWidget {
  InfoRecipeScreen({Key? key, required this.recipe}) : super(key: key);
  Recipe recipe;

  @override
  State<InfoRecipeScreen> createState() => _InfoRecipeScreenState();
}

class _InfoRecipeScreenState extends State<InfoRecipeScreen> {

   final RecipeController _recipeController = Get.put(RecipeController());
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _imageUrlController = TextEditingController();

  final TextEditingController _recipeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        leadingWidth:45 ,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
 
                backgroundColor: Colors.black,
                child: IconButton(
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () async {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
        ),
          title: const Text(
        'Info Recipe',
      ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () async {
                  Get.bottomSheet( Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight/0.5,
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'title',
                            labelHint:widget.recipe.title ,
                            multiLines: false,
                            controller: _titleController..text=widget.recipe.title.toString() ,
                          ),
                          CustomTextField(
                            label: 'description',
                            labelHint:widget.recipe.description ,
                            multiLines: false,
                            controller: _descriptionController..text=widget.recipe.description.toString(),
                          ),
                          CustomTextField(
                            label: 'imageUrl',
                            labelHint:widget.recipe.imageUrl ,
                            multiLines: false,
                            controller: _imageUrlController..text=widget.recipe.imageUrl.toString(),
                          ),
                          CustomTextField(
                            label: 'recipe',
                            labelHint:widget.recipe.recipe,

                            maxLines: 8,
                            multiLines: true,
                            controller: _recipeTextController..text=widget.recipe.recipe.toString(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: _validateRecipe,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                            ),
                            child: const Text('Edit Recipe'),
                          ),
                        ],
                      ),
                    ),
                  ),);
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
        ],),
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
                  widget.recipe.imageUrl!,
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
                  Center(
                    child: Text(
                      widget.recipe.title!,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    widget.recipe.description!,
                     style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
           const SizedBox(height: 10.0,),
                  Text(
                    widget.recipe.recipe!,
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

  _editRecipeToDB() async {
     await _recipeController.editRecipe(recipe:widget.recipe,title:_titleController.text,description:_descriptionController.text,imageUrl: _imageUrlController.text,recipetext: _recipeTextController.text);
  
  }

  _validateRecipe() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _recipeTextController.text.isNotEmpty &&
        _imageUrlController.text.isNotEmpty) {
      _editRecipeToDB();
     
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
