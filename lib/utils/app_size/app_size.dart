import 'package:flutter/widgets.dart';

double h=0,w=0;
class AppSize
{
  static final appSize = AppSize._();
  AppSize._();
  void size(context)
  {
    h =MediaQuery.of(context).size.height / 100;
    w =MediaQuery.of(context).size.width / 100;

  }
}
