import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MonAppli();
  }
}

class MonAppli extends StatelessWidget {
  const MonAppli({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

//la page d'accueil de l'application
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magazine Infos',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.brown,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Action à effectuer lorsque le bouton de menu est pressé
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action à effectuer lorsque le bouton de recherche est pressé
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
                width: 400,
                child: Column(children: [
                  Text(
                    'Bienvenue sur l\'application Magazine Infos !',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Découvrez les dernières actualités et articles intéressants.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ])),
            Image(
              image: AssetImage('assets/images/magazine1.jpg'),
              width: 400,
              height: 300,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Tu as cliqué dessus'); //affichage dans la console
          //affichage d'un message à l'utilisateur
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tu as cliqué dessus',
                  style: TextStyle(fontSize: 12, color: Colors.brown[900])),
              backgroundColor: Colors.brown[50],
            ),
          );
        },
        backgroundColor: Colors.brown,
        focusColor: Colors.brown[50],
        child: const Text("Click",
            style: TextStyle(fontSize: 12, color: Colors.white)),
      ),
    );
  }
}
