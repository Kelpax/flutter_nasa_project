

import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedStorage{

  static SharedPreferences? preferences;

  static const _token='token';
  static const _refreshToken='refreshToken';


  static Future<void> init() async => preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async => await preferences!.setString(_token, token);

  static String? getToken() => preferences!.getString(_token);

  static Future clearToken() => preferences!.remove(_token);

  static Future setRefreshToken(String refreshToken) async =>
      await preferences!.setString(_refreshToken, refreshToken);

  static String? getRefreshToken() => preferences!.getString(_refreshToken);

  static Future clearRefreshToken() => preferences!.remove(_refreshToken);

  static Future setStr(String key, String value) async{
    await preferences!.setString(key, value);
  }

  static String? getStr(String key){
    return preferences!.getString(key);
  }

  static Future clearStr(String key) async{
    preferences!.remove(key);
  }

  static Future setBool(String key, bool value) async{
    await preferences!.setBool(key, value);
  }

  static bool? getBool(String key){
    return preferences!.getBool(key);
  }

  static Future clearBool(String key) async{
    preferences!.remove(key);
  }


}