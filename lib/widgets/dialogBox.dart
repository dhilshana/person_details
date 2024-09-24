import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onConfirm;
  DialogBox({super.key,required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Do you want to delete?',style: TextStyle(
        fontSize: 18
      ),),
      actions: [
        TextButton(
          onPressed: () {
           onConfirm();

          },
          child: Text("Yes",style: TextStyle(
            color: Colors.indigo,
            fontSize: 15
          ),),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel",style: TextStyle(
            color: Colors.indigo,
            fontSize: 15
          ),),
        ),
      ],
    );
  }
}
