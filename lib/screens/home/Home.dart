import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tell_me/providers/themeProvider/themeProvider.dart';

class Home extends StatelessWidget {
  static const String id = "/home";

  @override
  Widget build(BuildContext context) {
    final currentThemeData = Provider.of<CustomTheme>(context);
    //currentThemeData.getThemeData();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon:
                    Icon(Icons.settings, color: Theme.of(context).accentColor),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 11,
                  child: Image.asset(
                    "assets/images/tell_me_logo_no background.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_rounded,
                    color: Theme.of(context).accentColor),
                onPressed: () {
                  currentThemeData.toggleTheme();
                },
              ),
            ],
          )
        ],
      ),
    ));
  }
}
