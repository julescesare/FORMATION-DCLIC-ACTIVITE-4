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
      body: const SingleChildScrollView(
          child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/magazine1.jpg'),
            width: 500,
            height: 300,
          ),
          PartieTitre(),
          PartieTexte(),
          PartieIcone(),
          PartieRubrique(),
        ],
      )),
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

//widgets pour les différentes parties de l'application
//widget pour le titre de la partie
class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //titre principal
            Text(
              'Bienvenue sur l\'application Magazine Infos !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            //titre secondaire
            Text(
              'Découvrez les dernières actualités et articles intéressants.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ));
  }
}

//widget pour le texte de la partie
class PartieTexte extends StatelessWidget {
  const PartieTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
            'Dans un monde en constante évolution, notre objectif est de vous offrir un contenu riche, pertinent et accessible, qui met en lumière les tendances actuelles, les innovations, ainsi que les histoires qui façonnent notre quotidien.À travers ce magazine, nous abordons des thématiques variées allant de la technologie, à la culture, en passant par l’éducation, l’entrepreneuriat et les enjeux de société. Chaque article est conçu pour informer, éveiller la curiosité et apporter une nouvelle perspective sur le monde qui nous entoure.Ce numéro met particulièrement l’accent sur [thème du numéro : ex. l’innovation numérique / la jeunesse africaine / l’entrepreneuriat local], un sujet au cœur des transformations actuelles.'));
  }
}

//widget pour l'image de la partie
class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/maquette-magazines-mode.avif',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/header_magazines2.webp',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

//widget pour la partie de l'icone
class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: const [
                  Icon(Icons.phone, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('TEL', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
            Container(
              child: Column(
                children: const [
                  Icon(Icons.email, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('MAIL', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
            Container(
              child: Column(
                children: const [
                  Icon(Icons.share, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('PARTAGE', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
          ],
        ));
  }
}
