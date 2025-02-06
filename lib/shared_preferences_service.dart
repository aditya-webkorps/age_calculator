import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  // PRIVATE CONSTRUCTOR
  SharedPreferencesService._internal();

  // SINGLETON FACTORY CONSTRUCTOR
  factory SharedPreferencesService() {
    return _instance;
  }

  static SharedPreferences? _pref;

  Future<void> initSharedPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  // KEYS OF SHARED PREFERENCES
  static const String kFirstName = "firstName";
  static const String kLastName = "lastName";
  static const String kEmail = "email";
  static const String kUserName = "userName";
  static const String kIsUserLoggedIn = "isUserLoggedIn";
  static const String kPassword = "password";

  Future<void> saveUserInfo(
      {required String firstName,
      required String lastName,
      required String emailId,
      required String userName}) async {
    await _pref?.setString(kFirstName, firstName);
    await _pref?.setString(kLastName, firstName);
    await _pref?.setString(kEmail, firstName);
    await _pref?.setString(kUserName, firstName);
  }

  /// THIS METHOD WILL SAVE THE STRING VALUE INTO SHARED PREFS
  Future<void> savePrefString(
      {required String key, required String value}) async {
    await _pref?.setString(key, value);
  }

  /// IT WILL RETURN STRING DATA FROM SHARED PREFERENCES
  String getPrefString({required String prefKey}) {
    return _pref?.getString(prefKey) ?? '';
  }

  bool getPrefBool({required String prefKey}) {
    return _pref?.getBool(prefKey) ?? false;
  }

  Future<void> savePrefBool(
      {required String prefKey, required bool value}) async {
    await _pref?.setBool(prefKey, value);
  }
}
