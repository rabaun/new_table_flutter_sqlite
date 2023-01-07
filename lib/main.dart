import 'package:flutter/material.dart';

import 'app.dart';
import 'data/repositories/user_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(repository: UserRepository()));
}
