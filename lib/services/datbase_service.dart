import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Creates the single instance using a private constructor.
  static final DatabaseService _instance = DatabaseService._internal();

  // Intercepts any attempts to create a DatabaseService and
  // instead returns the single, pre-existing instance.
  factory DatabaseService() {
    return _instance;
  }

  // This is a private constructor.
  // It can only be called from within the DatabaseService class itself.
  DatabaseService._internal();

  // Database instance, nullable initially
  static Database? _database;

  // Getter for the database instance, initializes if necessary
  Future<Database> get database async {
    // Check if database is already initialized
    if (_database != null) return _database!;

    // Initialize database if not already initialized
    _database = await _initDatabase();
    return _database!;
  }

  // Initializes the database
  Future<Database> _initDatabase() async {
    // 1. GET THE PATH TO DATABASE FILE
    String path = join(await getDatabasesPath(), 'users.db');

    // 2. OPEN THE DATABASE / CREATE THE DATABASE
    return await openDatabase(
      path,
      version: 1,
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        debugPrint("Database onUpgrade");
      },
      onCreate: (Database db, int version) async {
        debugPrint("Database onCreateCalled");

        // 3. CREATE TABLE : USER
        await db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, emailId TEXT, password TEXT)');
      },
    );
  }

  // INSERT USER VALUE INTO TABLE
  Future<void> insertUser({
    required int id,
    required String firstName,
    required String lastName,
    required String emailId,
    required String password,
  }) async {
    final db = await database;

    // await db.execute('INSERT INTO users VALUES ($firstName, $lastName $password)');
    await db.insert(
        'users',
        {
          'id': id,
          'firstName': firstName,
          'lastName': lastName,
          'emailId': emailId,
          'password': password,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, Object?>>> getUserList() async {
    final db = await database;

    return await db.query("users");
  }

  /// THIS METHOD WILL DELETE THE SPECIFIED USER
  Future<void> deleteUser({required String emailId}) async {
    final db = await database;

    await db.delete('users', where: 'emailId=?', whereArgs: [emailId]);

    // await db.execute("DELETE FROM users WHERE emailId='$emailId'");
  }
}
