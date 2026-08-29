# Activité 4 - Gestion des Rédacteurs

Une application mobile Flutter pour la gestion des rédacteurs de magazines, avec intégration Firebase Firestore.

## Vue d'ensemble

Cette application permet de gérer une base de données de rédacteurs pour des magazines. Elle offre une interface intuitive pour ajouter, modifier, supprimer et consulter les informations des rédacteurs en temps réel.

## Fonctionnalités principales

### ✨ Gestion des Rédacteurs
- **Ajouter un rédacteur** : Créer de nouveaux rédacteurs avec nom et spécialité
- **Modifier un rédacteur** : Mettre à jour les informations d'un rédacteur existant
- **Supprimer un rédacteur** : Retirer un rédacteur de la base de données
- **Consulter la liste** : Visualiser tous les rédacteurs en temps réel
- **Interface utilisateur** : Boutons larges et ergonomiques pour une meilleure accessibilité

### 🔄 Synchronisation temps réel
- Les données sont synchronisées en temps réel avec Firebase Firestore
- Les modifications sont instantanément reflétées dans l'interface

## Structure du projet

```
lib/
├── main.dart                          # Point d'entrée de l'application
├── controllers/
│   └── redacteur_controller.dart     # Logique métier - gestion des rédacteurs
├── models/
│   └── Redacteur.dart                # Modèle de données
└── views/
    ├── page_accueil.dart             # Page d'accueil - liste des rédacteurs
    ├── ajout_redacteur_page.dart     # Page d'ajout d'un rédacteur
    ├── modifier_redacteur_page.dart  # Page de modification d'un rédacteur
    ├── supprimer_redacteur_page.dart # Page de suppression d'un rédacteur
    ├── redacteur_info_page.dart      # Page d'affichage des détails
    └── widgets/                       # Composants réutilisables
        ├── section_titre.dart
        ├── section_texte.dart
        ├── section_icone.dart
        └── section_service.dart
```

## Installation et Configuration

### Prérequis
- Flutter SDK (version 3.0 ou supérieure)
- Dart SDK
- Un projet Firebase configuré
- Android Studio ou Xcode pour le développement mobile

### Étapes d'installation

1. **Cloner le projet**
```bash
git clone <url-du-projet>
cd FORMATION-DCLIC-ACTIVITE-4
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Configurer Firebase**
   - Créer un projet sur [Firebase Console](https://console.firebase.google.com)
   - Télécharger la configuration Firebase pour Android et iOS
   - Placer les fichiers de configuration appropriés :
     - `google-services.json` pour Android (déjà présent)
     - `GoogleService-Info.plist` pour iOS

4. **Exécuter l'application**

Pour Android :
```bash
flutter run
```

Pour iOS :
```bash
flutter run -d ios
```

## Utilisation

### Page d'accueil
- Affiche la liste de tous les rédacteurs
- Permet de naviguer vers les actions disponibles :
  - Ajouter un rédacteur
  - Modifier un rédacteur
  - Supprimer un rédacteur
  - Consulter les détails

### Ajouter un rédacteur
1. Cliquer sur le bouton "Ajouter un rédacteur"
2. Remplir le formulaire avec :
   - Nom du rédacteur (minimum 3 caractères)
   - Spécialité (minimum 3 caractères)
3. Cliquer sur "Ajouter"
4. Une confirmation s'affiche

### Modifier un rédacteur
1. Sélectionner un rédacteur depuis la liste
2. Cliquer sur "Modifier"
3. Mettre à jour les informations
4. Confirmer les modifications

### Supprimer un rédacteur
1. Sélectionner un rédacteur depuis la liste
2. Cliquer sur "Supprimer"
3. Confirmer la suppression

## Technologies utilisées

- **Framework** : Flutter
- **Langage** : Dart
- **Base de données** : Firebase Firestore
- **State Management** : StatefulWidget
- **Architecture** : MVC (Model-View-Controller)

## Dépendances principales

```yaml
firebase_core: ^2.0.0
cloud_firestore: ^4.0.0
flutter: latest
```

## Démonstration

### 📹 Vidéo de démonstration
Regardez la vidéo de démonstration complète du projet :

**Localisation** : `assets/video/demo_activite_firebase.mp4`

Cette vidéo montre :
- La navigation dans l'application
- L'ajout d'un nouveau rédacteur
- La modification d'un rédacteur existant
- La suppression d'un rédacteur
- La synchronisation en temps réel avec Firebase

## Schéma de base de données Firestore

### Collection : `redacteurs`

Chaque document contient :
```json
{
  "nom": "string - Nom du rédacteur",
  "specialite": "string - Spécialité du rédacteur"
}
```

**Exemple** :
```json
{
  "nom": "Jean Dupont",
  "specialite": "Technologie"
}
```

## Validations

Le formulaire d'ajout/modification inclut des validations :
- Le nom doit contenir au minimum 3 caractères
- La spécialité doit contenir au minimum 3 caractères
- Les champs ne peuvent pas être vides

## Design et UX

- **Couleur primaire** : Brun (#8B4513)
- **Interface intuitive** : Boutons larges et facilement accessibles
- **Feedback utilisateur** : Messages de confirmation et d'erreur
- **Responsive** : Adapté à différentes tailles d'écran

## Troubleshooting

### Erreur de connexion Firebase
- Vérifier que Firebase est correctement initialisé dans `main.dart`
- Vérifier la configuration Firebase et les règles Firestore
- S'assurer que la connexion Internet est active

### Erreur de compilation
```bash
flutter clean
flutter pub get
flutter run
```

## Contribution

Pour contribuer au projet :
1. Créer une branche pour votre fonctionnalité
2. Commiter vos modifications
3. Pousser vers la branche
4. Créer une Pull Request

## License

Ce projet est développé dans le cadre de la formation DCLIC.

## Support

Pour toute question ou problème :
- Consulter la [documentation Flutter](https://docs.flutter.dev/)
- Consulter la [documentation Firebase](https://firebase.google.com/docs)
- Contacter l'équipe de support DCLIC

---

**Dernière mise à jour** : 2026-08-29
