import 'package:flutter/material.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Recipe',
        ),
        centerTitle: true,
      ),
    );
  }
}
