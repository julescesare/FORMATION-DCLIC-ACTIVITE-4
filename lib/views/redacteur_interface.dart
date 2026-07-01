import 'package:activite_1/modeles/redacteur.dart';
import 'package:activite_1/services/database_manager.dart';
import 'package:flutter/material.dart';

class RedacteurInterface extends StatefulWidget {
  const RedacteurInterface({super.key});

  @override
  State<RedacteurInterface> createState() => _RedacteurInterfaceState();
}

class _RedacteurInterfaceState extends State<RedacteurInterface> {
  final DatabaseManager _dbManager = DatabaseManager.instance;
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();
  final _prenomController = TextEditingController();
  List<Redacteur> _redacteurs = [];
  Redacteur? _redacteurSelectionne;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _chargerRedacteurs();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _prenomController.dispose();
    _dbManager.close();
    super.dispose();
  }

  // Charger tous les redacteurs
  Future<void> _chargerRedacteurs() async {
    final redacteurs = await _dbManager.getAllRedacteurs();
    setState(() {
      _redacteurs = redacteurs;
    });
  }

  // CREATE - Ajouter un utilisateur
  Future<void> _ajouterRedacteur() async {
    if (_nomController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _prenomController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final redacteur = Redacteur(
      nom: _nomController.text,
      email: _emailController.text,
      prenom: _prenomController.text,
    );

    await _dbManager.insertRedacteur(redacteur);

    _chargerRedacteurs();
    _viderChamps();
  }

  // UPDATE - Modifier un redacteur
  Future<void> _modifierRedacteur() async {
    if (_redacteurSelectionne == null) return;

    final redacteur = Redacteur(
      id: _redacteurSelectionne!.id,
      nom: _nomController.text,
      email: _emailController.text,
      prenom: _prenomController.text,
    );

    await _dbManager.updateRedacteur(redacteur);
    _chargerRedacteurs();
    _viderChamps();
    setState(() {
      _redacteurSelectionne = null;
    });
  }

  // DELETE - Supprimer un redacteur
  Future<void> _supprimerRedacteur(int id) async {
    //affichage du message de confirmation avant la suppression
    final confirmation = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer ce rédacteur ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Supprimer'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
    if (confirmation == true) {
      await _dbManager.deleteRedacteur(id);
      _chargerRedacteurs();
    }
  }

  void _selectionnerRedacteur(Redacteur redacteur) {
    setState(() {
      _redacteurSelectionne = redacteur;
      _nomController.text = redacteur.nom;
      _emailController.text = redacteur.email;
      _prenomController.text = redacteur.prenom;
    });
  }

  void _viderChamps() {
    _nomController.clear();
    _emailController.clear();
    _prenomController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interface Rédacteur',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Formulaire
            Form(
              key: _formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomController,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Champ requis";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _prenomController,
                        decoration: const InputDecoration(
                          labelText: 'Prénom',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Champ requis";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Champ requis";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: _redacteurSelectionne == null
                                    ? _ajouterRedacteur
                                    : _modifierRedacteur,
                                child: Text(
                                    _redacteurSelectionne == null
                                        ? 'Ajouter'
                                        : 'Modifier',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown,
                                )),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                _viderChamps();
                                setState(() {
                                  _redacteurSelectionne = null;
                                });
                              },
                              child: const Text('Annuler'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Liste des redacteurs
            Expanded(
              child: ListView.builder(
                itemCount: _redacteurs.length,
                itemBuilder: (context, index) {
                  final redacteur = _redacteurs[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                          '${redacteur.prenom} ${redacteur.nom.toUpperCase()}'),
                      subtitle: Text('${redacteur.email}}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _selectionnerRedacteur(redacteur),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _supprimerRedacteur(redacteur.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
