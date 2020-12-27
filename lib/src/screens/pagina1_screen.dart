import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_animate_do/src/screens/navegacion_screen.dart';
import 'package:flutter_animate_do/src/screens/twitter_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
        duration: Duration(milliseconds: 1500),
            child: Text('Animaciones')
        ),
        actions: [
          IconButton(icon: FaIcon(FontAwesomeIcons.twitter), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterScreen()));
          }),
          IconButton(icon: Icon(Icons.navigate_next), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Pagina1Screen()));
          })
        ],
      ),
      floatingActionButton: BounceInDown(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionScreen()));
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        color: Colors.white,
        elevation: 10,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Boton(),
            _Boton(),
            _Boton(),
            _Boton(),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
                child: Icon(Icons.new_releases, color: Colors.blue, size: 40,)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
                child: Text('Titulo', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 1800),
                child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 2100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () =>{},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add, color: Colors.black, size: 40),
                Text(
                  'test',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
