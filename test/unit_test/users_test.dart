import 'package:flutter/material.dart';
import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/widget_test/add_users.dart';
import 'package:flutter_testing/widget_test/utils/database.dart';
import 'package:flutter_testing/widget_test/utils/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test database crud function", () {
    var database = Database();
    var user = User("Jaydeep", "Koladiya");

    test('create new user when addNewUser method call', () {
      database.addNewUser(user);
      expect(database.activeUsers.contains(user), true);
    });
    test('move user to archive when moveToArchive method call', () {
      database.moveToArchived(user);
      expect(database.archivedUsers.contains(user), true);
      expect(database.activeUsers.contains(user), false);
    });

    // testWidgets('veryfy add user button present on activeusers page',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(MyApp(child: AddUser()));
    //   var _fName = find.byKey(const Key("firstNameKey"));
    //   var _lName = find.byKey(const Key("lastNameKey"));
    //   var _submitButton = find.byKey(const Key("addUserBtn"));
    //   await tester.enterText(_fName, "Firts");
    //   await tester.enterText(_lName, "Test");
    //   await tester.tap(_submitButton);
    //   await tester.pump();
    //   expect(find.text("User added successfully"), findsOneWidget);
    // });
  });
}
