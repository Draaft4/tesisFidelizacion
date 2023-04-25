import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitodelizacion_app/constants.dart';
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  var constants = Constants();
  bool sesion = false;

  @override
  Widget build(BuildContext context) {
    constants.auth.authStateChanges().listen((User? user) {
      if (user == null) {
        sesion = false;
        print('User is currently signed out!');
      } else {
        sesion = true;
        print('User is signed in!');
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [sesion ? botonCerrarSesion() : botonLogin(context)],
        title: const Text('Promociones'),
      ),
      body: sesion ? mainSesion() : mainNoSesion(),
    );
  }

  IconButton botonCerrarSesion() {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        constants.auth
            .signOut()
            .then((value) => {Navigator.pushReplacementNamed(context, "/")});
      },
    );
  }

  IconButton botonLogin(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        icon: const Icon(Icons.login));
  }

  Widget mainSesion() => Container();

  ListView mainNoSesion() {
    return ListView(children: [
      cardPromociones(
          "Prom 1",
          Image.asset(
            "static/coffee-cup.png",
          )),
      cardPromociones(
          "Prom 2",
          Image.asset(
            "static/coffee-cup.png",
          )),
      cardPromociones(
          "Prom 2",
          Image.asset(
            "static/coffee-cup.png",
          )),
    ]);
  }

  Card cardPromociones(String val, Image imagen) {
    return Card(
      child: Column(
        children: [Text(val), SizedBox(height: 75, width: 75, child: imagen)],
      ),
    );
  }

}
