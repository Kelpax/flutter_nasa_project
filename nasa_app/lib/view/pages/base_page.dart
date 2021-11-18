import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nasa_app/core/api_constants.dart';
import 'package:nasa_app/core/app_state.dart';
import 'package:nasa_app/provider/auth_provider.dart';
import 'package:nasa_app/provider/nasa_pages_provider.dart';
import 'package:nasa_app/view/components/filter_pop_up.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  NasaPagesProvider? pagesProvider;
  AuthProvider? authProvider;
  @override
  void initState() {
    pagesProvider=Provider.of<NasaPagesProvider>(context,listen: false);
    authProvider=Provider.of<AuthProvider>(context,listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            currentIndex: pagesProvider!.bottomNavIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.cube), label: 'Curiosity'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.loop_thick), label: 'Opportunity'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.sparkles), label: 'Spirit'),
            ],
          ), tabBuilder: (BuildContext context, int index) {
            return pagesProvider!.pages[index];
        },
        ),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text("NASA APP"),
        trailing: Container(
          width: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  showCupertinoModalPopup(context: context, builder: (context)=>FilterPopUp());
                },
                  child: Icon(CupertinoIcons.option,size: 20,)),
              SizedBox(width: 2.w,),
              GestureDetector(
                onTap: (){
                  authProvider!.signOutUser(context);
                },
                  child: Icon(FontAwesomeIcons.signOutAlt,size: 20,)),
            ],
          ),
        ),
      ),
    );
  }
}
