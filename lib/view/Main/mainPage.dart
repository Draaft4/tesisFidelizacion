import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              icon: const Icon(Icons.login))
        ],
        title: const Text('Promociones'),
      ),
      body: ListView(children: [
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
      ]),
    );
  }

  Card cardPromociones(String val, Image imagen) {
    return Card(
      child: Column(
        children: [Text(val), SizedBox(height: 75, width: 75, child: imagen)],
      ),
    );
  }

  ListView listMenu() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: backgroundDrawer()),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {},
        ),
      ],
    );
  }

  Container backgroundDrawer() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("static/coffee-cup.png"), fit: BoxFit.cover),
      ),
    );
  }
}
