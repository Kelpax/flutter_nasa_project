import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasa_app/core/LocalSharedStorege.dart';
import 'package:nasa_app/core/app_state.dart';
import 'package:nasa_app/core/routers.dart';
import 'package:nasa_app/repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier{
  final AuthRepository? authRepository;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordReqController=TextEditingController();
  TextEditingController emailRegController=TextEditingController();

  var appState= AppState.WAITING;

  AuthProvider(this.authRepository);


  void registerUser(String email,String password, BuildContext context) async{
    try{
      appState =AppState.LOADING;
      notifyListeners();
      if( await authRepository!.createUser(emailRegController.text,passwordReqController.text)){

        Navigator.pushNamedAndRemoveUntil(context, Routers.base,(Route<dynamic> route) => false);
        userNameController.clear();
        emailRegController.clear();
        passwordReqController.clear();
        appState =AppState.DONE;
        notifyListeners();
      }
    }catch(e){

    }
  }

  void signInUser(String email,String password, BuildContext context) async{
    try{
      appState =AppState.LOADING;
      notifyListeners();
      if( await authRepository!.loginUser(emailController.text,passwordController.text)){
        Navigator.pushNamedAndRemoveUntil(context, Routers.base,(Route<dynamic> route) => false);
        emailController.clear();
        passwordController.clear();
        appState = AppState.DONE;
        notifyListeners();
      }else{
        appState=AppState.ERROR;
        notifyListeners();
      }
    }catch(e){
      appState=AppState.ERROR;
      notifyListeners();
    }
  }

  void signOutUser(BuildContext context) {
    try{
      appState =AppState.LOADING;
      notifyListeners();
      authRepository!.signOut();
      Navigator.pushNamedAndRemoveUntil(context, Routers.login,(Route<dynamic> route) => false);
      appState =AppState.DONE;
      notifyListeners();
    }catch(e){

    }
  }
}