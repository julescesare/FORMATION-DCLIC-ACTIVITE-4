//widget pour le texte de la partie
import 'package:flutter/material.dart';

class SectionTexte extends StatelessWidget {
  const SectionTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
            'Dans un monde en constante évolution, notre objectif est de vous offrir un contenu riche, pertinent et accessible, qui met en lumière les tendances actuelles, les innovations, ainsi que les histoires qui façonnent notre quotidien.À travers ce magazine, nous abordons des thématiques variées allant de la technologie, à la culture, en passant par l’éducation, l’entrepreneuriat et les enjeux de société. Chaque article est conçu pour informer, éveiller la curiosité et apporter une nouvelle perspective sur le monde qui nous entoure.Ce numéro met particulièrement l’accent sur [thème du numéro : ex. l’innovation numérique / la jeunesse africaine / l’entrepreneuriat local], un sujet au cœur des transformations actuelles.'));
  }
}
