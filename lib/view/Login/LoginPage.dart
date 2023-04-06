import 'dart:ui';

import 'package:fitodelizacion_app/styles/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [background(), backgroundFilter(), content()],
    );
  }

  BackdropFilter backgroundFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),
        ),
      ),
    );
  }

  Container background() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("static/splash.jpeg"), fit: BoxFit.cover),
      ),
    );
  }

  Widget content() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: labelLogin('Inicio de Sesión')),
                        const SizedBox(height: 25),
                        camposTexto('Correo Electrónico', false, Icons.mail, _emailController),
                        const SizedBox(height: 15),
                        camposTexto('Contraseña', true, Icons.lock, _passwordController),
                        const SizedBox(height: 35),
                        botonLogin(),
                        const SizedBox(height: 35),
                        const Center(
                          child: Text(
                            '- Registrate con: -',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            botonLogInGoogle(),
                            const SizedBox(width: 50),
                            botonLogInFacebok(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container camposTexto(String val, bool pwd, IconData icono, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white38,
      ),
      child: TextField(
        obscureText: pwd,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icono,
            color: Colors.white,
          ),
          hintText: val,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Text labelLogin(String val) {
    return Text(
      val,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  GestureDetector botonLogInFacebok() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white38,
        ),
        child: Image.asset('static/facebook.png'),
      ),
    );
  }

  GestureDetector botonLogInGoogle() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white38,
        ),
        child: Image.asset('static/google.png'),
      ),
    );
  }

  GestureDetector botonLogin() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white60,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              ' Log In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
