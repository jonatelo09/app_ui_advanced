import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_avanzado/pages/login/widgets/app_colors.dart';


class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  const RoundedButton({Key key,@required this.onPressed,@required this.label, this.backgroundColor}) 
      : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        child: Text(this.label, style: TextStyle(color: Colors.white, fontFamily: 'sans', letterSpacing: 1, fontSize: 18),),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        decoration: BoxDecoration(
          color: this.backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5
            )
          ]
        ),
      ), 
      onPressed: this.onPressed,
    );
  }
}