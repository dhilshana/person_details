import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  String title;
  String value;
  CustomRowWidget({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
                    child: Row(
                      children: [
                        Container(
                          width:70,
                          child: Text(title,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),),
                        ),
                    
                        Container(
                          width: 20,
                          child: Text(':',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),),
                        ),
                        Container(
                          child: Text(value,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                          ),),
                        ),
                      ],
                    ),
                  );
}
}