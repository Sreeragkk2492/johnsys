import 'package:flutter/material.dart';

class Textfiledwidget extends StatelessWidget {
  String textfieldname;
  TextEditingController controller;
  Textfiledwidget({required this.controller,required this.textfieldname});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: textfieldname,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
              ),
            );
  }
}