import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_sqflite_getx/config/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
