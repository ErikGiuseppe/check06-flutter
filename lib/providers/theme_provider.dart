import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void changeTheme() async {
    _isDark = !_isDark;
    print(_isDark);
    notifyListeners();
  }
}
