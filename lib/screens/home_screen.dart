import 'package:flutter/material.dart';
import 'package:flutterauthentication/widgets/buttons.dart';
import 'package:flutterauthentication/widgets/bottom_clipper.dart';
import 'package:flutterauthentication/widgets/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _logOut() {
    loginStatus();
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Logo(),
          Padding(
            child: Container(
              child: Buttons("LOGOUT", primary, Colors.white, Colors.white,
                  primary, _logOut),
              height: 60,
            ),
            padding: EdgeInsets.only(top: 140, left: 10, right: 10),
          ),
          Expanded(
            child: Align(
              child: ClipPath(
                child: Container(
                  color: Colors.white,
                  height: 900,
                ),
                clipper: BottomClipper(),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }

  loginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogged');
  }
}
