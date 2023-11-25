import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?>? putDataMode(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static bool getDataMode({required String key}) {
    return sharedPreferences?.getBool(key) ?? false;
  }
}
