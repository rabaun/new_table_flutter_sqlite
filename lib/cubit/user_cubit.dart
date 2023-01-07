import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/models/user.dart';
import '../data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  void getUsers() {
    emit(UserLoading());
    repository.getUsers().then((users) {
      emit(UserLoaded(users: users));
    });
  }

  void addUser(User user) {
    if (user.name.isEmpty) {
      emit(UserError(error: "Form is empty!"));
      return;
    }
    emit(UserLoading());
    repository.addUser(user: user).then((value) {
      getUsers();
    });
  }

  void getDatabase() {
    emit(UserLoading());
    repository.getUsers().then((users) {
      emit(UserLoaded(users: users));
    });
  }

  void updateUser(User user) {
    if (user.name.isEmpty) {
      emit(UserError(error: "Form is empty!"));
      return;
    }
    emit(UserLoading());
    repository.updateDatabase(user).then((value) {
      getUsers();
    });
  }

  void removeUser(User user) {
    emit(UserLoading());
    repository.removeUser(user).then((intRemove) {
      getUsers();
    });
  }
}
