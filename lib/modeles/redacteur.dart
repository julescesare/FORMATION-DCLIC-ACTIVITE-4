class Redacteur {
  final int? id;
  final String nom;
  final String prenom;
  final String email;

  Redacteur({
    this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  Redacteur.sansId(String nom, String prenom, String email)
      : id = null,
        nom = nom,
        prenom = prenom,
        email = email;

  // Convertir un Map (de la base de données) en Utilisateur
  factory Redacteur.fromMap(Map<String, dynamic> map) {
    return Redacteur(
      id: map['id'] as int?,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      email: map['email'] as String,
    );
  }
  // Convertir un Utilisateur en Map (pour la base de données)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
    };
  }
}
