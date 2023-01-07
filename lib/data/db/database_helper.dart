import 'dart:io' show File;
import 'package:path_provider/path_provider.dart'
    show getApplicationSupportDirectory;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3_library_windows/sqlite3_library_windows.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();
  static final DatabaseHelper dbHelper = DatabaseHelper();
  static Database? db;

  Future<Database> get database async => db ??= await _initDatabase();

  Future<Database> _initDatabase() async {
      open.overrideFor(OperatingSystem.windows, openSQLiteOnWindows);

      // Folder where the database will be stored
      final dbFolder = await getApplicationSupportDirectory();

      // If the database file doesn't exist, create it.
      File dbFile =
      await File("${dbFolder.path}\\sqlite3_library_windows_example\\db")
          .create(recursive: true);

      // Open the database file

      db?.execute(
          'CREATE TABLE IF NOT EXISTS list003 (id INTEGER PRIMARY KEY,name NVARCHAR(64) NOT NULL);');
      return sqlite3.open(dbFile.path);
    }
}