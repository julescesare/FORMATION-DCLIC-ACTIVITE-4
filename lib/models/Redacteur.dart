import 'package:cloud_firestore/cloud_firestore.dart';

class Redacteur {
  final String id; // ID du document Firestore
  final String nom;
  final String specialite;

  Redacteur({
    required this.id,
    required this.nom,
    required this.specialite,
  });

  // Convertir un DocumentSnapshot de Firestore en Redacteur
  factory Redacteur.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Redacteur(
      id: doc.id, // ID du document Firestore
      nom: data['nom'] as String,
      specialite: data['specialite'] as String,
    );
  }
  // Convertir un Redacteur en Map (pour la base de données)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'specialite': specialite,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Redacteur(id: $id, nom: $nom, specialite: $specialite)';
  }
}
