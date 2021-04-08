import 'package:flutter/material.dart';
import 'package:sinobasila/profilescreen.dart';

class Gotogen extends StatefulWidget {
  @override
  _GotogenState createState() => _GotogenState();
}

logout(BuildContext context) {
  Navigator.pop(context);
}

Color gradientStart = Color(0xFFc0c0aa); //Change start gradient color here
Color gradientEnd = Color(0xFF1cefff); //Ch

class _GotogenState extends State<Gotogen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            backgroundColor: Colors.tealAccent,
            title: Text('Essel Park QR Code Generator',
             style: TextStyle(color: Colors.black45)),
            
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

              GestureDetector(
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
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Qrcode(),
                  ),
                ),
              ), //Container

              Divider(),

              Padding(
                padding: const EdgeInsets.only(top: 108.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      logout(context);
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
                            BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "LOGOUT",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
