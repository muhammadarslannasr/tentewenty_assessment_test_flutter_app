import 'package:flutter/cupertino.dart';

class UiResponsive{

  static double getWidth({required BuildContext context}){
    return MediaQuery.of(context).size.width;
  }

  static double getHeight({required BuildContext context}){
    return MediaQuery.of(context).size.height;
  }

}