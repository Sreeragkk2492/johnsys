import 'package:flutter/material.dart';
import 'package:johnsys/controller/counter.dart';
import 'package:johnsys/view/Welcomepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Myapp());
  WidgetsFlutterBinding.ensureInitialized(); 
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (context)=>CounterProvider()),
    ] ,child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    ) ,);
    
  }
}
