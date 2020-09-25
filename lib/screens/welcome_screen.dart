import 'package:flutter/material.dart';
import 'package:flutterauthentication/widgets/buttons.dart';
import 'package:flutterauthentication/widgets/logo.dart';
import 'package:flutterauthentication/widgets/user_input.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_clipper.dart';

bool isLogged;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    void initState() {
      super.initState();
    }

    //Function for Login Button
    void _loginUser() async {
      if (formKey.currentState.validate()) {
        _email = _emailController.text;
        _password = _passwordController.text;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //Return String
        String email = prefs.getString('email');
        String password = prefs.getString('password');
        print(email + password);
        if (_emailController.text == email &&
            _passwordController.text == password) {
          prefs.setBool('isLogged', true);
          Navigator.of(context).pushNamed('/home');
        } else if (_emailController.text != email &&
            _passwordController.text == password) {
          showToast(
            'Wrong Email',
            duration: Duration(seconds: 3),
            position: ToastPosition.bottom,
            backgroundColor: Colors.red.shade900,
            radius: 20.0,
            textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          );
        } else if (_emailController.text == email &&
            _passwordController.text != password) {
          showToast(
            'Wrong Password',
            duration: Duration(seconds: 3),
            position: ToastPosition.bottom,
            backgroundColor: Colors.red.shade900,
            radius: 20.0,
            textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          );
        } else {
          showToast(
            'Wrong Email and Password',
            duration: Duration(seconds: 3),
            position: ToastPosition.bottom,
            backgroundColor: Colors.red.shade900,
            radius: 20.0,
            textStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          );
        }
      }
    }

    //Function for Registration Button
    void _registerUser() async {
      if (formKey.currentState.validate()) {
        _email = _emailController.text;
        _password = _passwordController.text;
        _displayName = _nameController.text;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', _nameController.text.toString());
        prefs.setString('email', _emailController.text.toString());
        prefs.setString('password', _passwordController.text.toString());
        prefs.setBool('isLogged', true);
        Navigator.of(context).pushNamed('/home');
      }
    }

    //Login Tab design with clip path
    void _loginSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Form(
                          autovalidate: true,
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Email(emailController: _emailController),
                              ),
                              Password(
                                passwordController: _passwordController,
                                errorText: "Password must be six characters",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            child: Buttons("LOGIN", Colors.white, primary,
                                primary, Colors.white, _loginUser),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    //Registration Tab design with clip path
    void _registerSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                              _nameController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25, right: 40),
                                child: Text(
                                  "REGI",
                                  style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                child: Container(
                                  padding: EdgeInsets.only(top: 45, left: 35),
                                  width: 150,
                                  child: Text(
                                    "STER",
                                    style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        autovalidate: true,
                        key: formKey,
                        child: Column(
                          children: [
                            UserName(nameController: _nameController),
                            Email(emailController: _emailController),
                            Password(
                              passwordController: _passwordController,
                              errorText: "Please enter a strong password",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: Buttons("REGISTER", Colors.white, primary,
                              primary, Colors.white, _registerUser),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    //First page design
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Logo(),
          Padding(
            child: Container(
              child: Buttons("LOGIN", primary, Colors.white, Colors.white,
                  primary, _loginSheet),
              height: 50,
            ),
            padding: EdgeInsets.only(top: 150, left: 10, right: 10),
          ),
          Padding(
            child: Container(
              child: OutlineButton(
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                highlightElevation: 0.0,
                splashColor: Colors.white,
                highlightColor: Theme.of(context).primaryColor,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(60.0),
                ),
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                onPressed: () {
                  _registerSheet();
                },
              ),
              height: 50,
            ),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          ),
          Expanded(
            child: Align(
              child: ClipPath(
                child: Container(
                  color: Colors.white,
                  height: 300,
                ),
                clipper: BottomClipper(),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
    );
  }
}
