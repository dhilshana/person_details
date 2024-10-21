import 'package:flutter/foundation.dart';
import 'package:sqf_lite/services/local_database.dart';

class DataProvider extends ChangeNotifier{

  LocalDatabase ldb = LocalDatabase();
   List<Map<String, dynamic>> listofdata = [];

    Future<void> loadData() async {
    listofdata = await ldb.retrieveValue();
    notifyListeners();
  }

   void addData(Map<String,dynamic> value) async{
    ldb.insertValue(name: value['name'],place: value['place'],email: value['email'],age: value['age']);
    listofdata = await ldb.retrieveValue();
    notifyListeners();

   }

   void editData(Map<String,dynamic> value,) async{
    ldb.updateValue(name: value['name'],age: value['age'],place: value['place'],email: value['email'],newValues: value['newValues']);
    listofdata = await ldb.retrieveValue();
    notifyListeners();
   }
  

  void deleteData(Map<String,dynamic> value) async{
    ldb.deleteValue(name: value['name'],age: value['age'],place: value['place'],email: value['email']);
    listofdata = await ldb.retrieveValue();
    notifyListeners();
  }
}