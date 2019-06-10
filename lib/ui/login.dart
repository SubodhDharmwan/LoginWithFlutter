import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

// Save data and show it.
// ignore: unused_element
class _LoginData {
  var name = "";
  var password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>(); // We can access from every where.

  var _loginData = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      // Images.
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                "images/face.png",
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
          ),

          // Name Text Field
          Padding(
            padding:
                const EdgeInsets.only(left: 4, top: 15, right: 40, bottom: 15),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 4.0,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: "Enter your name",
                icon: new Icon(Icons.text_fields),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your name";
                } else {
                  _loginData.name = value;
                  print("All is good.");
                }
              },
            ),
          ),

          // Password Text Field
          Padding(
            padding:
                const EdgeInsets.only(left: 4, top: 15, right: 40, bottom: 15),
            child: new TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    gapPadding: 4.0,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: "Enter your password",
                  icon: new Icon(Icons.text_fields),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter your name";
                  } else {
                    _loginData.password = value;
                  }
                }),
          ),

          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              // Submit button
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _loginData.name = _loginData.name;
                        _loginData.password = _loginData.password;
                      });
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: new Text("All is goode")));
                    }
                  },
                  color: Colors.green,
                  child: new Text(
                    "Submit",
                  ),
                ),

                // Clear button
                new RaisedButton(
                  onPressed: () {

                    _formKey.currentState.reset();

                    setState(() {
                      _loginData.name = "";
                      _loginData.password = "";

                    });
                  },
                  color: Colors.redAccent,
                  child: new Text(
                    "Clear",
                  ),
                )
              ],
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: _loginData.name.isEmpty ? Text(""): Text(
                "${_loginData.name} ${_loginData.password}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
