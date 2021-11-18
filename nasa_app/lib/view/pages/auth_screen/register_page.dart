import 'package:flutter/cupertino.dart';
import 'package:nasa_app/core/app_state.dart';
import 'package:nasa_app/core/style/app_style.dart';
import 'package:nasa_app/provider/auth_provider.dart';
import 'package:nasa_app/view/components/social_signin_button.dart';
import 'package:nasa_app/view/pages/base_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context,listen: true);
    return SafeArea(
        child: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 10),
                    alignment: Alignment.topLeft,
                    child:
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                        child: Icon( CupertinoIcons.back,size: 40,)),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Center(child: Text("REGISTER",style: AppStyle.titleText))),
                  SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("User Name",style: AppStyle.inputTitleText,)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CupertinoTextField(
                      controller: authProvider.userNameController,
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey2),
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("E-mail",style: AppStyle.inputTitleText,)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CupertinoTextField(
                        controller: authProvider.emailRegController,
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey2),
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Password",style: AppStyle.inputTitleText,)),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CupertinoTextField(
                        obscureText: true,
                        controller: authProvider.passwordReqController,
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
                      child: CupertinoButton(child: authProvider.appState==AppState.LOADING ? Container(
                        width: 40.w,
                          child: Center(child: CupertinoActivityIndicator(),)):Text("Sign Up"), onPressed: (){
                       authProvider.registerUser(authProvider.emailRegController.text, authProvider.passwordReqController.text, context);
                      },borderRadius:
                      BorderRadius.circular(20),color: CupertinoColors.activeOrange,),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
