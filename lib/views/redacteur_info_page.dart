import 'package:activite_1/controllers/redacteur_controller.dart';
import 'package:activite_1/models/Redacteur.dart';
import 'package:activite_1/views/modifier_redacteur_page.dart';
import 'package:activite_1/views/supprimer_redacteur_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RedacteurInfoPage extends StatelessWidget {
  final RedacteurController controller;

  const RedacteurInfoPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations des Rédacteurs'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.redacteursStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erreur: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Aucun rédacteur trouvé'),
            );
          }

          // Récupérer et mapper les données à partir de snapshot
          final redacteurs = snapshot.data!.docs
              .map((doc) => Redacteur.fromFirestore(doc))
              .toList();

          return ListView.builder(
            itemCount: redacteurs.length,
            itemBuilder: (context, index) {
              final redacteur = redacteurs[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.brown),
                  title: Text(redacteur.nom),
                  subtitle: Text(redacteur.specialite),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          // Navigation vers ModifierRedacteurPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModifierRedacteurPage(
                                redacteur: redacteur,
                                controller: controller,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Navigation vers SupprimerRedacteurPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupprimerRedacteurPage(
                                redacteur: redacteur,
                                controller: controller,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
