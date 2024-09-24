import 'package:flutter/material.dart';
import 'package:sqf_lite/services/local_database.dart';

class DetailScreen extends StatelessWidget {
  String? name;
  String? place;
  String? email;
  int? age;
  bool isUpdate;
DetailScreen({super.key,this.age,this.email,this.name,this.place,this.isUpdate=false});

  
  LocalDatabase ldb = LocalDatabase();


  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController(text: name ?? '');
    TextEditingController ageController = TextEditingController(text: age != null?age.toString():'');
  TextEditingController placeController = TextEditingController(text: place?? '');
  TextEditingController emailController = TextEditingController(text: email??'');
    return SafeArea(child: Scaffold(
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
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 2
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
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
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 2
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
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
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 2
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
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
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 2
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: () async{
              if(nameController.text.isNotEmpty&&ageController.text.isNotEmpty&&placeController.text.isNotEmpty&&emailController.text.isNotEmpty){
                if(isUpdate){
                ldb.updateValue( name!,
                      age!,
                      place!,
                      email!,
                      {
                        'name': nameController.text,
                        'age': int.parse(ageController.text),
                        'place': placeController.text,
                        'email': emailController.text,
                      },);
              }
              else{
              await ldb.insertValue(name: nameController.text,place: placeController.text,email: emailController.text,age: int.parse(ageController.text));
              }
               Navigator.pop(context);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter the fields")));
              }
              
             
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.indigo[100]),
              foregroundColor: WidgetStatePropertyAll(Colors.black)
            ),
             child: Text("Save"),
             )
          ],
        ),
      ),
    ));
  }
}