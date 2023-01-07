import '../../models/user.dart';
import '../database_helper.dart';

class UserDao {
  final dbHelper = DatabaseHelper.dbHelper;

  Future<List<User>> getUsers() async {
    final db = await dbHelper.database;
    var maps = await db.select('SELECT * FROM list003 ORDER BY id;');
    List<User> userList =
    maps.isNotEmpty ? maps.map((e) => User.fromMap(e)).toList() : [];
    return userList;
  }

  Future<List<User>> getNameFromDatabase() async {
    final db = await dbHelper.database;
    var users = await db.select('SELECT name FROM list003;');
    List<User> userList =
        users.isNotEmpty ? users.map((e) => User.fromMap(e)).toList() : [];
    return userList;
  }

  Future<void> addUser(User user) async {
    final db = await dbHelper.database;
    var users = db.execute(
        'INSERT INTO list003 (name) VALUES (?)', [(user.name)]);
    return users;
  }

  void updateDatabase(User user) async {
    final db = await dbHelper.database;
    db.execute('UPDATE list003 SET name = name WHERE id = ${user.id};');
  }

  void removeUser(User user) async {
    final db = await dbHelper.database;
    db.execute('DELETE FROM list003 WHERE id IN (${user.id});');
  }
}
