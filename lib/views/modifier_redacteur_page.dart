import 'package:activite_1/controllers/redacteur_controller.dart';
import 'package:activite_1/models/Redacteur.dart';
import 'package:flutter/material.dart';

class ModifierRedacteurPage extends StatefulWidget {
  final Redacteur redacteur;
  final RedacteurController controller;

  const ModifierRedacteurPage({
    required this.redacteur,
    required this.controller,
    super.key,
  });

  @override
  State<ModifierRedacteurPage> createState() => _ModifierRedacteurPageState();
}

class _ModifierRedacteurPageState extends State<ModifierRedacteurPage> {
  late TextEditingController _nomController;
  late TextEditingController _specialiteController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs avec les données actuelles du rédacteur
    _nomController = TextEditingController(text: widget.redacteur.nom);
    _specialiteController =
        TextEditingController(text: widget.redacteur.specialite);
  }

  @override
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  Future<void> _enregistrerModifications() async {
    if (_nomController.text.trim().isEmpty ||
        _specialiteController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.controller.modifierRedacteur(
        widget.redacteur.id,
        _nomController.text.trim(),
        _specialiteController.text.trim(),
      );

      if (mounted) {
        _afficherDialogConfirmation();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _afficherDialogConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Succès'),
          content: const Text('Le rédacteur a été modifié avec succès.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fermer la boîte de dialogue
                Navigator.pop(context); // Revenir à la page précédente
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier un Rédacteur'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                labelText: 'Nom du Rédacteur',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _specialiteController,
              decoration: InputDecoration(
                labelText: 'Spécialité',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.work),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _enregistrerModifications,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    )
                  : const Text(
                      'Enregistrer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
