import 'package:flutter/material.dart';
import 'package:johnsys/controller/counter.dart';
import 'package:johnsys/view/Welcomepage.dart';
import 'package:johnsys/view/widgets/button.dart';
import 'package:johnsys/view/widgets/textfieldwidget.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatelessWidget {
 final TextEditingController ucontroller=TextEditingController();
 final TextEditingController pcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CounterProvider>(builder: (context, value, child) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Textfiledwidget(
                controller: ucontroller,
                textfieldname: 'Username',
              ),
              SizedBox(
                height: 10,
              ),
              Textfiledwidget(
                controller: pcontroller,
                textfieldname: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              Button(onclick: () {
              var res=  value.registeruser(ucontroller.text, pcontroller.text);
              if(res !=null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('registered succesfully')));
              }else{
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('registeration failed'))); 
              }
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage()));
              }, buttonname: 'Register'), 
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Already Registered?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage()));
                      },
                      child: Text(
                        'Login', 
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ))
                ],
              )
            ],
          ),
        );
      },
         
      ),
    );
  }
}