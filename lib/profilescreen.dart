import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcode extends StatefulWidget {
  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  bool _visible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String qrstring;

  Future getqr() {
    String email = emailController.text;
    String password = passwordController.text;
    setState(() {
      _visible = true;
      qrstring = email.toString() + password.toString();
    });
    print(qrstring);
  }

  Color gradientStart = Color(0xFFc0c0aa); //Change start gradient color here
  Color gradientEnd = Color(0xFF1cefff);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.green,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            backgroundColor: Colors.tealAccent,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Essel Park QR Code Generator',
              style: TextStyle(color: Colors.black45),
            ),
            automaticallyImplyLeading: false),
        body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: 280,
                padding: EdgeInsets.all(40.0),
              ),
              _visible
                  ? QrImage(
                      data: qrstring,
                      gapless: true,
                      size: 150,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                    )
                  : Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/home.png'),
                          fit: BoxFit.cover,
                        ), //DecorationImage
                      ), //BoxDecoration
                    ), //Container

              Divider(),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailController,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Guest Name'),
                  )),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: passwordController,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Plate Number'),
                  )),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: RaisedButton(
              //     onPressed: () {
              //       getqr();
              //     },
              //     color: Colors.green,
              //     textColor: Colors.white,
              //     padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
              //     child: Text('Click Here To Generate QR'),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      getqr();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
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
                        constraints:
                            BoxConstraints(maxWidth: 270.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "GENERATE QR",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
