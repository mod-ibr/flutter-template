// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  final Future<SharedPreferences> _sharedPreferencesData =
      SharedPreferences.getInstance();

  saveThemeData() async {
    SharedPreferences sharedPreferencesData = await _sharedPreferencesData;
    sharedPreferencesData.setBool("isDarkTheme", _isDarkTheme);
    print("saving :  isDarkTheme : $_isDarkTheme");
  }

  getThemeData() async {
    SharedPreferences sharedPreferencesData = await _sharedPreferencesData;
    _isDarkTheme = sharedPreferencesData.getBool("isDarkTheme") ?? false;
    // print("getting :  isDarkTheme : $_isDarkTheme");
    notifyListeners();
  }

  bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    saveThemeData();
    print("is theme Dark  :$_isDarkTheme ");
    notifyListeners();
  }

// Edit Light Theme
  ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.orange, fontSize: 50, fontFamily: "Nunito"),
          headline6: TextStyle(
              color: Colors.orange, fontSize: 50, fontFamily: "Nunito"),
        ),
        titleTextStyle: TextStyle(
            color: Colors.orange, fontSize: 30, fontFamily: "Nunito"),
        color: Colors.white,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      primaryColor: Colors.orange,
      accentColor: Colors.black,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFFf9faff),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Colors.teal[900], fontSize: 60, fontFamily: "Nunito"),
        headline2: TextStyle(
            color: Colors.teal[900], fontSize: 40, fontFamily: "Nunito"),
        bodyText1: TextStyle(
            color: Colors.teal[900], fontSize: 100, fontFamily: "Nunito"),
        bodyText2: TextStyle(
            color: Colors.teal[900], fontSize: 80, fontFamily: "Nunito"),
      ),
    );
  }

// Edit Dark Theme
  ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.teal[900],
        centerTitle: true,
        elevation: 0.0,
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          headline6: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "Nunito"),
        ),
      ),
      primaryColor: Colors.orange,
      accentColor: Colors.white,
      backgroundColor: Colors.grey[700],
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.teal, fontFamily: "Nunito"),
        headline2: TextStyle(color: Colors.teal, fontFamily: "Nunito"),
        bodyText1: TextStyle(color: Colors.teal, fontFamily: "Nunito"),
        bodyText2:
            TextStyle(color: Colors.teal, fontSize: 25, fontFamily: "Nunito"),
      ),
    );
  }
}
