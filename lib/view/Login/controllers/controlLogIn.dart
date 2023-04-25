import "package:fitodelizacion_app/constants.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class controlLogIn {
  var constants = Constants();

  void registro(String email, String pass, context) {
    try {
      constants.auth
          .createUserWithEmailAndPassword(
            email: email,
            password: pass,
          )
          .then((value) => {
                print("Registrado"),
                Navigator.pushReplacementNamed(context, '/')
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Error: La contraseña debe contener 12 caracteres entre letras y signos."),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error: Ya existe una cuenta con ese correo."),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String pass, context) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) => {
              Navigator.pushReplacementNamed(context, "/"),
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Bienvenido: ${email}"),
              ))
            });
  }

  void loginGoogle() {}

  void loginFb() {}
}
