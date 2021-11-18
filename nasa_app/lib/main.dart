import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/core/routers.dart';
import 'package:nasa_app/provider/auth_provider.dart';
import 'package:nasa_app/provider/nasa_pages_provider.dart';
import 'package:nasa_app/repository/auth_repository.dart';
import 'package:nasa_app/repository/nasa_repository.dart';
import 'package:nasa_app/view/pages/auth_screen/login_page.dart';
import 'package:nasa_app/view/pages/auth_screen/register_page.dart';
import 'package:nasa_app/view/pages/base_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/LocalSharedStorege.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSharedStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider(AuthRepository())),
        ChangeNotifierProvider(create: (context)=>NasaPagesProvider()),
      ],
      child: ResponsiveSizer(
        builder: (BuildContext , Orientation , ScreenType )=>
            CupertinoApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routes: {
            '/login': (context)=> LoginPage(),
            '/register': (context)=> RegisterPage(),
            '/base': (context)=> BasePage(),
          },
          initialRoute: Routers.initial,
          home: LoginPage(),
        ),
      ),
    );
  }
}


