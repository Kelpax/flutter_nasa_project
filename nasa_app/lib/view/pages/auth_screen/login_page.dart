import 'package:flutter/cupertino.dart';
import 'package:nasa_app/core/app_state.dart';
import 'package:nasa_app/core/routers.dart';
import 'package:nasa_app/core/style/app_style.dart';
import 'package:nasa_app/provider/auth_provider.dart';
import 'package:nasa_app/view/components/social_signin_button.dart';
import 'package:nasa_app/view/pages/base_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatelessWidget {

   LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: true);
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.secondarySystemBackground,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              Container(
                  alignment: Alignment.center,
                  child: Center(child: Text("LOGIN",style: AppStyle.titleText))),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Text("E-mail",style: AppStyle.inputTitleText,)),
              Container(
                margin: EdgeInsets.only(left: 80,right: 80,top: 10,bottom: 10),
                child: CupertinoTextField(
                    controller: authProvider.emailController,
                    padding: EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey2),
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Text("Password",style: AppStyle.inputTitleText,)),
              Container(
                margin: EdgeInsets.only(left: 80,right: 80,top: 10,bottom: 10),
                child: CupertinoTextField(
                    obscureText: true,
                    controller: authProvider.passwordController,
                    padding: EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey2),
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: CupertinoButton(child:
                  authProvider.appState==AppState.LOADING ?
                  Container(
                      width: 40.w,
                      child:Center(child: CupertinoActivityIndicator(),)):
                  Text("Sign In"), onPressed: (){
                    authProvider.signInUser(authProvider.emailController.text, authProvider.passwordController.text, context);
                  },borderRadius:
                  BorderRadius.circular(20),color: CupertinoColors.activeOrange,),
                ),
              ),
              SizedBox(height: 10,),

              Container(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(child: Text("Register Now"), onPressed: (){
                  Navigator.pushNamed(context, Routers.register);
                },),
              ),
            ],
          ),
        )
      )
    );
  }
}
