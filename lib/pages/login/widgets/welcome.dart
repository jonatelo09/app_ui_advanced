import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_avanzado/utils/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: LayoutBuilder(
        builder: (_,constraints) {
          return Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/login/clouds.svg',
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.7,
                    color: Color(0xffdddddd),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.7,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 3,
                        width: constraints.maxWidth,
                        color: Color(0xffeeeeee),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        '¡Bienvenido Otra Vez!', 
                        style: TextStyle(
                          fontSize: responsive.ip(2.3), 
                          fontWeight: FontWeight.w900,
                          fontFamily: 'raleway'
                        ),
                      )
                    ],
                  )
                ),
                Positioned(
                  top: constraints.maxHeight * 0.285,
                  child: SvgPicture.asset(
                    'assets/login/woman.svg',
                    width: constraints.maxWidth*0.35,
                  ),
                  
                ),
                Positioned(
                  top: constraints.maxHeight * 0.285,
                  left: constraints.maxHeight,
                  child: SvgPicture.asset(
                    'assets/login/men.svg',
                    width: constraints.maxWidth*0.28,
                    ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}