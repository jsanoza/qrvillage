import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sinobasila/goto.dart';
import 'package:sinobasila/profilescreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Qrcode(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            'Essel Park QR Code Generator',
            style: TextStyle(color: Colors.black45),
          ),
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(child: LoginUser()),
      ),
    );
  }
}

class LoginUser extends StatefulWidget {
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State {
  bool _isVisible = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future userLogin() async {
    setState(() {
      _isVisible = false;
    });
    String email = emailController.text;
    String password = passwordController.text;
    var url = 'https://villagesystem.000webhostapp.com/conn2.php';
    var data = {'email': email, 'password': password};
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    if (message == 'Login Matched') {
      setState(() {
        _isVisible = true;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Gotogen()));
      emailController.text = "";
      passwordController.text = "";
    } else {
      setState(() {
        _isVisible = true;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _isVisible = true;
                },
              ),
            ],
          );
        },
      );
    }
  }

  Color gradientStart = Color(0xFFc0c0aa); //Change start gradient color here
  Color gradientEnd = Color(0xFF1cefff); //Ch

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [gradientStart, gradientEnd], begin: const FractionalOffset(0.5, 0.0), end: const FractionalOffset(0.0, 0.5), stops: [0.0, 1.0], tileMode: TileMode.clamp),
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: ExactAssetImage('assets/home.png'),
                        fit: BoxFit.cover,
                      ), //DecorationImage
                    ), //BoxDecoration
                  ), //Containe
                ),
                Divider(),
                Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailController,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: 'Username'),
                    )),
                Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordController,
                      autocorrect: true,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                    )),
                // RaisedButton(
                //   onPressed: userLogin,
                //   color: Colors.green,
                //   textColor: Colors.white,
                //   padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                //   child: Text('LOGIN'),
                // ),
                _isVisible
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              userLogin();
                            },
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFC466B), Color(0xFF3F5EFB)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 270.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "LOGIN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(margin: EdgeInsets.only(bottom: 30), child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
