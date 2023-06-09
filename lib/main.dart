import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_firebase/screens/controle.page.dart';

Future<void > main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControlePage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
    );
  }
}

