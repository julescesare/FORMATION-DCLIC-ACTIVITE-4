//la page d'accueil de l'application
import 'package:activite_1/controllers/redacteur_controller.dart';
import 'package:activite_1/views/ajout_redacteur_page.dart';
import 'package:activite_1/views/redacteur_info_page.dart';
import 'package:activite_1/widgets/section_icone.dart';
import 'package:activite_1/widgets/section_service.dart';
import 'package:activite_1/widgets/section_texte.dart';
import 'package:activite_1/widgets/section_titre.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  late RedacteurController _redacteurController;

  @override
  void initState() {
    super.initState();
    // Instanciation du contrôleur
    _redacteurController = RedacteurController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magazine Infos',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action à effectuer lorsque le bouton de recherche est pressé
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Gestion des Rédacteurs',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.brown),
              title: const Text('Ajouter un Rédacteur'),
              onTap: () {
                Navigator.pop(context);
                // Navigation vers la page d'ajout avec injection du contrôleur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AjoutRedacteurPage(controller: _redacteurController),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.brown),
              title: const Text('Informations des Rédacteurs'),
              onTap: () {
                Navigator.pop(context);
                // Navigation vers la page d'informations avec injection du contrôleur
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RedacteurInfoPage(controller: _redacteurController),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
          child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/magazine1.jpg'),
            width: 500,
            height: 300,
          ),
          SectionTitre(),
          SectionTexte(),
          SectionIcone(),
          SectionRubrique(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Tu as cliqué dessus'); //affichage dans la console
          //affichage d'un message à l'utilisateur
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Tu as cliqué dessus',
                style: TextStyle(fontSize: 12, color: Colors.brown[900]),
              ),
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
