import 'package:flutter/material.dart';
import 'package:flutter_ui_avanzado/pages/home/home_page.dart';
import 'package:flutter_ui_avanzado/pages/login/login_page.dart';
import 'package:flutter_ui_avanzado/pages/splash/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterUIAdvance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'sans'),
      home: SplashPage(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SplashPage.routeName: (_) => SplashPage(),
        LoginPage.routeName: (_) => LoginPage(),
      },
    );
  }
}
