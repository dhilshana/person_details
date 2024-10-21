

import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  static Database? database;

  Future initializeDb() async{
    database =await openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  join(await getDatabasesPath(), 'personal_details.db'),
   onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE person(name TEXT, age INTEGER, email TEXT , place TEXT)',
    );
  },
    version: 1,

);
  }

  Future<void> insertValue({required String name,required int age,required String place,required String email})async{
    var values = {
      'name' : name,
      'age' : age,
      'place' : place,
      'email' : email
    };
    var a = await database?.insert('person',values ,conflictAlgorithm: ConflictAlgorithm.replace,
);

  }

  Future retrieveValue() async{
    var valueMap = await database?.query('person');

    return valueMap;
  }


  Future<void> deleteValue({required String name,required int age,required String place,required String email}) async{
    await database?.delete(
      'person',
      where: 'name =? AND age =? AND place =? AND email =?',
      whereArgs: [name,age,place,email]
      );
  }

  Future<void> updateValue({required String name,required int age,required String place,required String email,required Map<String, dynamic> newValues,}) async{
    await database?.update(
      'person', 
      newValues,
      where: 'name =? AND age =? AND place =? AND email =?',
       whereArgs: [name,age,place,email]
      );
  }
}