import 'package:cloud_firestore/cloud_firestore.dart';

class RedacteurController {
  // Instance de FirebaseFirestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Stream pour écouter les changements dans la collection "redacteurs"
  Stream<QuerySnapshot> get redacteursStream =>
      _firestore.collection('redacteurs').snapshots();

  // Méthode pour ajouter un rédacteur à la collection "redacteurs"
  Future<void> ajouterRedacteur(String nom, String specialite) async {
    await _firestore.collection('redacteurs').add({
      'nom': nom,
      'specialite': specialite,
    });
  }

  // Méthode pour modifier un rédacteur dans la collection "redacteurs"
  Future<void> modifierRedacteur(
      String id, String nom, String specialite) async {
    await _firestore.collection('redacteurs').doc(id).update({
      'nom': nom,
      'specialite': specialite,
    });
  }

  // Méthode pour supprimer un rédacteur de la collection "redacteurs"
  Future<void> supprimerRedacteur(String id) async {
    await _firestore.collection('redacteurs').doc(id).delete();
  }
}
