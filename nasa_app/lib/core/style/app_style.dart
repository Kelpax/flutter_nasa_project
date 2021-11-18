import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

abstract class AppStyle{
  static TextStyle titleText=TextStyle(fontSize: 30,color: CupertinoColors.black,decoration: TextDecoration.none);
  static TextStyle inputTitleText=TextStyle(fontSize: 15,color: CupertinoColors.black,decoration: TextDecoration.none );
  static TextStyle inputSubTitleText=TextStyle(fontSize: 15,color: CupertinoColors.systemGrey,decoration: TextDecoration.none );
  static TextStyle itemTitleText=TextStyle(fontSize: 13,color: CupertinoColors.black,decoration: TextDecoration.none );
  static TextStyle itemSubTitleText=TextStyle(fontSize: 12,color: CupertinoColors.systemGrey,decoration: TextDecoration.none );

}