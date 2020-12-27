import 'package:flutter/material.dart';
import 'package:flutter_animate_do/src/screens/pagina1_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Pagina1Screen(),
      // home: TwitterScreen(),
      // home: NavegacionScreen(),
    );
  }
}
