import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  @override
  _TwitterScreenState createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {

  bool activado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1da1f2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){
          print('pulsaod');
          setState(() {
            activado = true;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Center(
        child: ZoomOut(
            animate: activado,
            // delay: Duration(milliseconds: 1000),
            // duration: Duration(milliseconds: 2000),
            from: 30,
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            )),
      ),
    );
  }
}
