import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqf_lite/main.dart';
import 'package:sqf_lite/services/local_database.dart';
import 'package:sqf_lite/services/provider.dart';

class DetailScreen extends StatelessWidget {
  String? name;
  String? place;
  String? email;
  int? age;
  bool isUpdate;
  DetailScreen(
      {super.key,
      this.age,
      this.email,
      this.name,
      this.place,
      this.isUpdate = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: name ?? '');
    TextEditingController ageController =
        TextEditingController(text: age != null ? age.toString() : '');
    TextEditingController placeController =
        TextEditingController(text: place ?? '');
    TextEditingController emailController =
        TextEditingController(text: email ?? '');
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "Update" : "Create"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 2))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 2))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: placeController,
              decoration: InputDecoration(
                  labelText: 'Place',
                  labelStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 2))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.indigo,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.indigo, width: 2))),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    ageController.text.isNotEmpty &&
                    placeController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (isUpdate) {
                    context.read<DataProvider>().editData({
                      'name': name!,
                      'age': age!,
                      'place': place!,
                      'email': email!,
                      'newValues': {
                        'name': nameController.text,
                        'age': int.parse(ageController.text),
                        'place': placeController.text,
                        'email': emailController.text,
                      },
                  });
                  } else {
                    context.read<DataProvider>().addData({
                      'name': nameController.text,
                      'place': placeController.text,
                      'email': emailController.text,
                      'age': int.parse(ageController.text)
                    });
                  }
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter the fields")));
                }
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.indigo[100]),
                  foregroundColor: WidgetStatePropertyAll(Colors.black)),
              child: Text("Save"),
            )
          ],
        ),
      ),
    ));
  }
}
