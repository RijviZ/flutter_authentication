import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

var isLogged;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isLogged = preferences.getBool('isLogged');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Color(0xFF00C1D1),
          fontFamily: "Lato",
          canvasColor: Colors.transparent),
      home: isLogged !=null ? Home():WelcomeScreen(),
      routes: <String, WidgetBuilder> {
        '/welcome': (BuildContext context) => new WelcomeScreen(),
        '/home' : (BuildContext context) => new Home(),
      },
    );
  }

}