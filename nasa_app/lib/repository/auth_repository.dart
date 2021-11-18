import 'package:firebase_auth/firebase_auth.dart';
import 'package:nasa_app/core/LocalSharedStorege.dart';

class AuthRepository{
  String? userId;
  String? userEmail;
  String? userPassword;
  bool createSuccess = false;
  FirebaseAuth fbAuth=FirebaseAuth.instance;

  Future<bool> createUser(String email,String password) async {

    try{
      UserCredential userCredential = await fbAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        userId=userCredential.user!.uid;
        LocalSharedStorage.setToken(userId!);
        userEmail=userCredential.user!.email;
        createSuccess = true;
        return createSuccess;
      }
    }catch(e){
      print(e.toString());
    }
    return createSuccess;
  }

  Future<bool> loginUser(String email,String password) async {
    try{
      UserCredential userCredential = await fbAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        userId=userCredential.user!.uid;
        userEmail=userCredential.user!.email;
        LocalSharedStorage.setToken(userId!);
        createSuccess = true;
        return createSuccess;
      }
    }catch(e){
      print(e.toString());
    }
    return createSuccess;
  }

  void signOut()async{
   await fbAuth.signOut();
    LocalSharedStorage.clearToken();
  }

}