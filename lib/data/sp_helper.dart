import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper() {
    initSp();
  }
  SharedPreferences sharedPreferences;
  initSp() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  setToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  Future<String> getToken() async {
    await initSp();
    String token = sharedPreferences.getString('token');
    return token;
  }

  removeToken() async {
    await sharedPreferences.remove('token');
  }
}
