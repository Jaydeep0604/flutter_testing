import 'package:flutter/material.dart';
import 'package:flutter_testing/main.dart';
import 'package:flutter_testing/widget_test/add_users.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('veryfy add user button present on activeusers page',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(child: AddUser()));

    var _fName = find.byKey(const Key("firstNameKey"));
    var _lName = find.byKey(const Key("lastNameKey"));

    var _submitButton = find.byType(ElevatedButton);

    await tester.enterText(_fName, "Firtst");
    await tester.enterText(_lName, "Test");

    await tester.tap(_submitButton);
    
    await tester.pump();
    
    expect(find.text("User added successfully"), findsOneWidget);
  });
}
