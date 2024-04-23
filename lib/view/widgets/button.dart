import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback onclick;
  String buttonname;
  Button({required this.onclick, required this.buttonname});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(onPressed: onclick, child: Text(buttonname,style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),));
  }
}
