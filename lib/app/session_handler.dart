import 'package:shared_preferences/shared_preferences.dart';

class SessionHandle {
  Future afterFirstRun() async {
    //runs only once after initial run
    //generate unique id for device -> IMSI
    String imsi = new DateTime.now().millisecondsSinceEpoch.toString();
    print("imsi: ${imsi}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("firstRun", false);
  }

  Future<bool> checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("firstRun: ${prefs.getBool("firstRun")}");
    return prefs.getBool("firstRun") ?? true;
  }


  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}