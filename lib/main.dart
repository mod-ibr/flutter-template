import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tell_me/providers/themeProvider/themeProvider.dart';

import 'package:tell_me/screens/splash_intro/splash.dart';

int? isviewed;

void main() async {
  // runApp(DevicePreview(builder: (context) => MyApp()));
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  print("bbefore : $isviewed");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //builder: DevicePreview.appBuilder,
      providers: [
        ChangeNotifierProvider<CustomTheme>(
          create: (_) => CustomTheme(),
        ),
      ],
      child: MymaterialApp(),
    );
  }
}

class MymaterialApp extends StatelessWidget {
  const MymaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentThemeData = Provider.of<CustomTheme>(context);
    currentThemeData.getThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tell Me',
      theme: currentThemeData.lightTheme,
      darkTheme: currentThemeData.darkTheme,
      themeMode: currentThemeData.currentTheme,
      home: SplashScreen(),
    );
  }
}
