import 'dart:ui';

import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      background(),
      backgroundFilter()
    ],);
  }
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
              image: AssetImage(
                  "static/splash.jpeg"),
              fit: BoxFit.cover),
        ),
      );
  }