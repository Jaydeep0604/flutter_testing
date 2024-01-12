import 'package:flutter/material.dart';
import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/widget_test/utils/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Database extends ChangeNotifier {
  List<User> activeUsers = [];
  List<User> archivedUsers = [];

//Creates new user and adds to activeUsers
  Future<void> addNewUser(User user) async {
    activeUsers.add(user);
    notifyListeners();
  }

//Moves user from active to achived
  void moveToArchived(User user) {
    archivedUsers.add(user);
    activeUsers.remove(user);
    notifyListeners();
  }

//Moves user from archived to active
  void moveToActive(User user) {
    activeUsers.add(user);
    archivedUsers.remove(user);
    notifyListeners();
  }

//Deletes user from database
  bool deleteUser({required User user, required Source source}) {
    switch (source) {
      case Source.active:
        activeUsers.remove(user);
        notifyListeners();
        return true;
      case Source.archived:
        archivedUsers.remove(user);
        notifyListeners();
        return true;
    }
  }
}

// with shared preferences

// class Database extends ChangeNotifier {
//   List<User> activeUsers = [];
//   List<User> archivedUsers = [];
//   SharedPreferences? _prefs;

//   // Initialize SharedPreferences
//   Database() {
//     _initPrefs();
//   }

//   Future<void> _initPrefs() async {
//     _prefs = await SharedPreferences.getInstance();
//     // Load data from SharedPreferences on initialization
//     _loadData();
//   }

//   // Load data from SharedPreferences to lists
//   void _loadData() {
//     final String? activeUsersJson = _prefs?.getString('activeUsers');
//     final String? archivedUsersJson = _prefs?.getString('archivedUsers');

//     if (activeUsersJson != null) {
//       activeUsers = (json.decode(activeUsersJson) as List<dynamic>)
//           .map((e) => User.fromJson(e))
//           .toList();
//     }

//     if (archivedUsersJson != null) {
//       archivedUsers = (json.decode(archivedUsersJson) as List<dynamic>)
//           .map((e) => User.fromJson(e))
//           .toList();
//     }

//     notifyListeners();
//   }

//   // Save data to SharedPreferences
//   Future<void> _saveData() async {
//     await _prefs?.setString('activeUsers', json.encode(activeUsers));
//     await _prefs?.setString('archivedUsers', json.encode(archivedUsers));
//   }

//   //Creates new user and adds to activeUsers
//   Future<void> addNewUser(User user) async {
//     activeUsers.add(user);
//     await _saveData();
//     notifyListeners();
//   }

//   //Moves user from active to archived
//   Future<void> moveToArchived(User user) async {
//     archivedUsers.add(user);
//     activeUsers.remove(user);
//     await _saveData();
//     notifyListeners();
//   }

//   //Moves user from archived to active
//   Future<void> moveToActive(User user) async {
//     activeUsers.add(user);
//     archivedUsers.remove(user);
//     await _saveData();
//     notifyListeners();
//   }

//   //Deletes user from database
//   Future<bool> deleteUser({required User user, required Source source}) async {
//     switch (source) {
//       case Source.active:
//         activeUsers.remove(user);
//         await _saveData();
//         notifyListeners();
//         return true;
//       case Source.archived:
//         archivedUsers.remove(user);
//         await _saveData();
//         notifyListeners();
//         return true;
//     }
//   }
// }
