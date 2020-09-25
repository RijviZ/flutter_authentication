import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Email extends StatelessWidget {
  const Email({
    Key key,
    @required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        controller: _emailController,
        obscureText: false,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            hintText: "EMAIL",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: Icon(Icons.email),
              ),
              padding: EdgeInsets.only(left: 25, right: 10),
            )),
        validator: MultiValidator([
          EmailValidator(errorText: "Please enter a valid email"),
          RequiredValidator(errorText: "*required")
        ]),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    Key key,
    @required TextEditingController passwordController,
    @required String errorText,
  })
      : _passwordController = passwordController,
        _errorText = errorText,
        super(key: key);

  final TextEditingController _passwordController;
  final String _errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            hintText: "PASSWORD ",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme
                    .of(context)
                    .primaryColor),
                child: Icon(Icons.lock),
              ),
              padding: EdgeInsets.only(left: 25, right: 10),
            )),
        validator: MinLengthValidator(6, errorText: _errorText),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key key,
    @required TextEditingController nameController,
  })
      : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
        top: 60,
      ),
      child: TextFormField(
        controller: _nameController,
        obscureText: false,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            hintText: "DISPLAY NAME",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme
                    .of(context)
                    .primaryColor),
                child: Icon(Icons.account_circle),
              ),
              padding: EdgeInsets.only(left: 25, right: 10),
            )),
        validator:
        MinLengthValidator(3, errorText: "Please enter a valid name"),
      ),
    );
  }
}
