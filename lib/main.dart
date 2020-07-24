import 'package:flutter/material.dart';
import 'package:flutter_ui_avanzado/pages/login/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterUIAdvance',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => LoginPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sans'
      ),
    );
  }
}