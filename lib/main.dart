import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/home_screen_provider.dart';
import 'package:statemanagement/providers/lightDarkProvider.dart';
import 'package:statemanagement/providers/loginScreenProvider.dart';
import 'package:statemanagement/providers/secondScreenProvider.dart';
import 'package:statemanagement/screens/home_scree.dart';
import 'package:statemanagement/screens/ligthDarkApp.dart';
import 'package:statemanagement/screens/loginScreen.dart';
import 'package:statemanagement/screens/notifiyListnerScreen.dart';
import 'package:statemanagement/screens/secondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
      ChangeNotifierProvider(create: (_) => SecondScreenProvider()),
      ChangeNotifierProvider(create: (_) => LightDarkProvider()),
      ChangeNotifierProvider(create: (_) => LoginScreenProvider())
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    ),
    );
  }
}

