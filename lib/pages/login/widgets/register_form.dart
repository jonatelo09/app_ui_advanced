import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_avanzado/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/app_colors.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/input_text_login.dart';
import 'package:flutter_ui_avanzado/utils/responsive.dart';
import 'package:flutter_ui_avanzado/widgets/rounded_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  void _goTo(BuildContext context, FirebaseUser user) {
    if (user != null) {
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
              Text(
                "New Account",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'raleway',
                ),
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                iconPath: 'assets/login/icon-user.svg',
                placeholder: "Username",
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
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
              SizedBox(
                height: responsive.ip(2),
              ),
              InputTextLogin(
                iconPath: 'assets/login/icon-password.svg',
                placeholder: "Confirm you password...",
              ),
              SizedBox(
                height: responsive.ip(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                        }),
                  ),
                  Text('Back to login', style: TextStyle(color: Colors.black),),
                  RoundedButton(
                    onPressed: () {},
                    label: "Sign In",
                  ),
                ],
              ),
              SizedBox(
                height: responsive.ip(1),
              ),
              SizedBox(
                height: responsive.ip(2.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
