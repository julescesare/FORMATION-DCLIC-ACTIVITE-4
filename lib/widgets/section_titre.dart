//widget pour le titre de la partie
import 'package:flutter/material.dart';

class SectionTitre extends StatelessWidget {
  const SectionTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //titre principal
            const Text(
              'Bienvenue sur l\'application Magazine Infos !',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //titre secondaire
            Text(
              'Découvrez les dernières actualités et articles intéressants.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ));
  }
}
