import 'package:activite_1/modeles/redacteur.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager instance = DatabaseManager._init();
  static Database? _database;

  DatabaseManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('magazineInfoDB.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE redacteurs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE
        
      )
    ''');
  }

  // CREATE - Insérer un redacteur
  Future<int> insertRedacteur(Redacteur redacteur) async {
    final db = await database;
    return await db.insert(
      'redacteurs',
      redacteur.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ - Lire tous les redacteurs
  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await database;
    final result = await db.query('redacteurs', orderBy: 'nom');
    return result.map((map) => Redacteur.fromMap(map)).toList();
  }

  // READ - Lire un redacteur par ID
  Future<Redacteur?> getRedacteurById(int id) async {
    final db = await database;
    final result = await db.query(
      'redacteurs',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Redacteur.fromMap(result.first);
    }
    return null;
  }

  // UPDATE - Mettre à jour un redacteur
  Future<int> updateRedacteur(Redacteur redacteur) async {
    final db = await database;
    return await db.update(
      'redacteurs',
      redacteur.toMap(),
      where: 'id = ?',
      whereArgs: [redacteur.id],
    );
  }

  // DELETE - Supprimer un redacteur
  Future<int> deleteRedacteur(int id) async {
    final db = await database;
    return await db.delete(
      'redacteurs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Fermeture de la connexion à la base de données
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
