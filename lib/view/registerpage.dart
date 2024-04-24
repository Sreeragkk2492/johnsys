import 'package:johnsys/model/usermodel.dart';

import 'package:flutter/material.dart';
import 'package:johnsys/controller/counter.dart';
import 'package:johnsys/services/databasesql.dart';
import 'package:johnsys/view/Welcomepage.dart';
import 'package:johnsys/view/widgets/button.dart';
import 'package:johnsys/view/widgets/textfieldwidget.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class Registerpage extends StatelessWidget {
  final TextEditingController ucontroller = TextEditingController();
  final TextEditingController pcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) {
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
                Button(
                    onclick: () {
                     value.registeruser(ucontroller.text, pcontroller.text);
                   
                     // validateregister(context,getalluser,value);  
                    },
                    buttonname: 'Register'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Already Registered?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WelcomePage()));
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

  // void validateregister(
  //     BuildContext context,Future< List<User>> reguser, CounterProvider value) async {
  //   final username = ucontroller.text;
  //   final password = pcontroller.text;

  //   bool userExist = false;
  //   final validateemail = EmailValidator.validate(username);
  //   if (username != '' && password != '') {
  //     if (validateemail == true) {
       
  //       if (userExist == true) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('failed user already exist')));
  //       } else {
  //         if (password.length < 6) {
  //           ScaffoldMessenger.of(context)
  //               .showSnackBar(SnackBar(content: Text('password should be >6')));
  //         } else {
  //           final user = User(username: username, password: password);
  //           await value.registeruser(username, password);
  //           ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(content: Text('user registration success')));
  //         }
  //       }
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('invalid data or email')));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('empty fields')));
  //   }
  // }
}
