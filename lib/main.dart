import 'package:flutter/material.dart';

import 'home.dart';

// void main() {
//   runApp(const MyApp());
// }
// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nerdle Unlimited',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Home(title: 'Nerdle Unlimited'),
    );
  }
}
