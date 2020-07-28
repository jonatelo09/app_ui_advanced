import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/login_form.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/register_form.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/welcome.dart';
import 'package:flutter_ui_avanzado/utils/responsive.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    if (!isTablet) {
      // smartphone
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: OrientationBuilder(
            builder: (_, Orientation orientation) {
              if (orientation == Orientation.portrait) {
                return SingleChildScrollView(
                  child: Container(
                    height: responsive.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Welcome(),
                        Expanded(
                          child: PageView(
                          children: <Widget>[
                            LoginForm(),
                            RegisterForm(),
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              } else {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          height: responsive.height,
                          child: Center(
                            child: Welcome(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: responsive.height,
                          child: Center(
                            child: LoginForm(),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          )),
    ));
  }
}
