import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/login_form.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/welcome.dart';
import 'package:flutter_ui_avanzado/utils/responsive.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                height: responsive.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Welcome(),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}