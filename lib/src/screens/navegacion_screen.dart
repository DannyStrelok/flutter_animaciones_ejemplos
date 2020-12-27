import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notificaciones'),
          backgroundColor: Colors.blueGrey,
        ),
        floatingActionButton: _BotonFlotante(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final int notificaciones = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bone), label: 'Algo',),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0,
                    top: 0,
                    // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent,)
                  child: BounceInDown(
                    animate: (notificaciones > 0) ? true : false,
                    from: 20,
                    child: Bounce(
                      from: 10,
                      controller: (controller) => Provider.of<_NotificationModel>(context, listen: false).bounceController = controller,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle
                        ),
                        child: Text('$notificaciones', style: TextStyle(color: Colors.white, fontSize: 9),),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Algo2',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.dog), label: 'Algo3',),
        ]
    );
  }
}


class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
        onPressed: () {
          final notoficationModel = Provider.of<_NotificationModel>(context, listen: false);
          int valor = notoficationModel.numero;
          valor++;
          notoficationModel.numero = valor;
          if(valor >= 2) {
            final controller =notoficationModel.bounceController;
            controller.forward(from: 0.0);
          }

        },
        child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController _bounceController;

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController value) {
    _bounceController = value;
    // notifyListeners();
  }
}