import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_avanzado/libs/auth.dart';
import 'package:flutter_ui_avanzado/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/input_text_login.dart';
import 'package:flutter_ui_avanzado/utils/responsive.dart';
import 'package:flutter_ui_avanzado/widgets/circle_button.dart';
import 'package:flutter_ui_avanzado/widgets/rounded_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  void _goTo(BuildContext context, FirebaseUser user){
    if(user != null){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      print("Login Faild");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        top: false,
        child: Container(
          width: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InputTextLogin(
                iconPath: 'assets/login/icon-email.svg',
                placeholder: "Enter you email address...",
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                iconPath: 'assets/login/icon-password.svg',
                placeholder: "Enter you password...",
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(fontFamily: 'sans'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              RoundedButton(onPressed: () {}, label: "Sign In"),
              SizedBox(
                height: responsive.ip(3.3),
              ),
              Text(
                "Or continue with",
                style: TextStyle(fontFamily: 'sans'),
              ),
              SizedBox(
                height: responsive.ip(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleButton(
                    iconPath: "assets/login/facebook.svg",
                    size: 55,
                    backgroundColor: Color(0xff448AFF),
                    onPressed: () async {
                      final user = await Auth.instance.facebook(context);
                      _goTo(context, user);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleButton(
                    iconPath: "assets/login/google.svg",
                    size: 55,
                    backgroundColor: Color(0xffFF1744),
                    // onPressed: null,
                    onPressed: () async {
                      final user = await Auth.instance.google(context);
                      _goTo(context, user);
                    },
                  )
                ],
              ),
              SizedBox(
                height: responsive.ip(2.7),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  CupertinoButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
