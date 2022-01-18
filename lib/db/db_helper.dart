import 'package:flutter/material.dart';
import 'package:recipe_sqflite_getx/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBHelper {
  static final int _version = 1;

  static final String _tableName = 'recipes';

  static Database? _db;
// how you can open database in first time
  static Future<void> initDb() async {
    if (_db != null) {
      print('not null db');
      return;
    } else {
      try {
        // Get a location using getDatabasesPath
        var databasesPath = await getDatabasesPath();
        String _path = databasesPath + 'recipe.db';

        _db = await openDatabase(
          _path,
          version: _version,
          onCreate: (db, version) async {
            debugPrint('Creating a new one');
            await db.execute(
              'CREATE TABLE $_tableName ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title STRING, description TEXT, imageUrl STRING,'
              'recipe TEXT)',
            );
          },
        );
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

// insert in database
  static Future<int> insertInDB(Recipe recipe) async {
    return await _db!.insert(_tableName, recipe.toJson());
  }

// get all item in database simple
  static Future<List<Map<String, dynamic>>> queryFromDB() async {
    return await _db!.query(_tableName);
  }

  static Future<int> deleteFromDB(Recipe recipe) async {
    return await _db!
        .delete(_tableName, where: 'id = ?', whereArgs: [recipe.id]);
  }

  static Future<void> updateInDB(Recipe recipe, String title,
      String description, String imageUrl, String recipetext) async {
    await _db!.rawUpdate('''
    UPDATE $_tableName
    SET title  = ?, description = ?, imageUrl  = ?,
    recipe  = ?
    WHERE id = ?
    ''', [title, description, imageUrl, recipetext, recipe.id]);
    
  }
}
