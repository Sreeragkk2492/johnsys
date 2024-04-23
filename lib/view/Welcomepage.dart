import 'package:flutter/material.dart';
import 'package:johnsys/controller/counter.dart';
import 'package:johnsys/view/homepage.dart';
import 'package:johnsys/view/registerpage.dart';
import 'package:johnsys/view/widgets/button.dart';
import 'package:johnsys/view/widgets/textfieldwidget.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CounterProvider>(builder: (context, value, child,) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Textfiledwidget(
                controller: usernamecontroller,
                textfieldname: 'Username',
              ),
              SizedBox(
                height: 10,
              ),
              Textfiledwidget(
                controller: passcontroller,
                textfieldname: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              Button(onclick: () {
                var islogedin=value.loginUser(usernamecontroller.text, passcontroller.text);
                if(islogedin!=null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login failed')));
                }
                 
              }, buttonname: 'Login'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Dont have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Registerpage()));
                      },
                      child: Text(
                        'Register',
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
