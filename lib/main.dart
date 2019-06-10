import 'package:flutter/material.dart';
import 'package:login_app/ui/login.dart';

void main(){
  runApp(new MaterialApp(
    title: "Login",
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final String appTitle = "Login";
    return new MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(
            appTitle,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: CustomLoginForm(),
      ),

    );
  }
}