import 'package:flutter/cupertino.dart';
import 'package:nasa_app/core/LocalSharedStorege.dart';
import 'package:nasa_app/core/api_constants.dart';
import 'package:nasa_app/core/app_state.dart';
import 'package:nasa_app/repository/nasa_repository.dart';
import 'package:nasa_app/view/pages/bottom_tab_pages/curiosity_page.dart';
import 'package:nasa_app/view/pages/bottom_tab_pages/opportunity_page.dart';
import 'package:nasa_app/view/pages/bottom_tab_pages/spirit_page.dart';

class NasaPagesProvider extends ChangeNotifier{
  NasaRepository? nasaRepository=NasaRepository();

  var appState=AppState.WAITING;

  PageController pageController = PageController();
  var bottomNavIndex=0;


  var sol="";
  var page=1;
  var camera="";
  var roverName="";

  void filters(){

  }


  List<Widget> pages=[
    CuriosityPage(),
    OpportunityPage(),
    SpiritPage(),
  ];

}