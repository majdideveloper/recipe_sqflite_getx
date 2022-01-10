import 'dart:convert';

class Recipe {
  int? id;
  String? title;
  String? description;
  String? imageUrl;
  String? recipe;
  Recipe({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.recipe,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'recipe': recipe,
    };
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    recipe = json['recipe'];
  }
}
