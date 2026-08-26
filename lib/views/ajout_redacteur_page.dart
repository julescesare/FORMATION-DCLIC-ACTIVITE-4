import 'package:activite_1/controllers/redacteur_controller.dart';
import 'package:flutter/material.dart';

class AjoutRedacteurPage extends StatefulWidget {
  final RedacteurController controller;

  const AjoutRedacteurPage({required this.controller, super.key});

  @override
  State<AjoutRedacteurPage> createState() => _AjoutRedacteurPageState();
}

class _AjoutRedacteurPageState extends State<AjoutRedacteurPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _specialiteController = TextEditingController();
  bool _isLoading = false;

  // Style personnalisé pour le bouton
  final ButtonStyle styleBouton = ElevatedButton.styleFrom(
    backgroundColor: Colors.brown,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  Future<void> _ajouterRedacteur() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.controller.ajouterRedacteur(
        _nomController.text.trim(),
        _specialiteController.text.trim(),
      );

      if (mounted) {
        _afficherSuccesDialog();
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

  void _afficherSuccesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Succès'),
          content: const Text('Le rédacteur a été ajouté avec succès.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fermer la boîte de dialogue
                Navigator.pop(context); // Revenir à la page précédente
              },
              style: styleBouton,
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
        title: const Text('Ajouter un Rédacteur'),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom du Rédacteur',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Le nom ne peut pas être vide';
                  }
                  if (value.length < 3) {
                    return 'Le nom doit contenir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _specialiteController,
                decoration: InputDecoration(
                  labelText: 'Spécialité',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'La spécialité ne peut pas être vide';
                  }
                  if (value.length < 3) {
                    return 'La spécialité doit contenir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _ajouterRedacteur,
                style: styleBouton,
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
                        'Ajouter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
