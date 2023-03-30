import 'package:fitodelizacion_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitodelizacion_app/styles/colors.dart';
import 'dart:ui';

late bool cargando;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var constants = Constants();

  @override
  void initState() {
    super.initState();
    cargando = true;
    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        background(),
        backgroundFilter(),
        content(),
      ]),
    );
  }

  Column content() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Card(
                    color: AppColors.backCard,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                          const SizedBox(height: 16.0),
                          CircularProgressIndicator(color: AppColors.circularProgress),
                        ],
                      ),
                      
                    ),
                  ))),
        ],
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
              image: AssetImage(
                  "static/splash.jpeg"),
              fit: BoxFit.cover),
        ),
      );
  }

  cargarDatos() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      cargando = !cargando;
    });
    navegar();
  }

  navegar() async {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
