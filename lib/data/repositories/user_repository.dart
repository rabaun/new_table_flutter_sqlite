import '../db/dao/user_dao.dart';
import '../models/user.dart';

class UserRepository {
  final userDao = UserDao();

  getNameFromDatabase() => userDao.getNameFromDatabase();

  addUser({required User user}) => userDao.addUser(user);

  getUsers() => userDao.getUsers();

  updateDatabase(User user) => userDao.updateDatabase(user);

  removeUser(User user) => userDao.removeUser(user);
}
