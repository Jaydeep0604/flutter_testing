import 'package:flutter/material.dart';
import 'package:flutter_testing/login/login_screen.dart';
import 'package:flutter_testing/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<String> emailList = [
    "test@gmail.co",
    "test@gmail.com",
    "fest@gmail.com",
    "",
    "sadadssadsa",
    "11111111111",
    "a1a1a11aa11a",
    "123!#56575675",
    "?><|LJHI@G>CP",
    "sd#sdffd.cpcd",
    "a!@#D.So,",
  ];
  List<String> passwordList = [
    "Test@g45",
    "Fast@123",
    "Test@123",
    "54555445554",
    "!!!#GSAH@1",
    "",
    "!@gG2154",
    "T@13454%6",
    "}{@)(+0)}*&*0_",
    "/*TESa@11ads",
    "test@test"
  ];

  for (var email in emailList) {
    for (var password in passwordList) {
      createTestFunction(email, password);
    }
  }
}

void createTestFunction(String email, String password) {
  testWidgets(
      'verify login functionality with email: $email and password: $password',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(child: LoginScreen()));

    var emailField = find.byKey(const Key("emailKey"));
    var passwordField = find.byKey(const Key("passwordKey"));
    var loginBtn = find.byKey(const Key("loginButtonKey"));

    await tester.enterText(emailField, email);
    await tester.enterText(passwordField, password);
    await tester.tap(loginBtn);
    await tester.pump();

    // Check the expected error message based on the email and password values
    String expectedErrorMessage = "";
    if (email == "") {
      expectedErrorMessage = "Please enter email address";
    } else if (password == "") {
      expectedErrorMessage = "Please enter password";
    } else if (!RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
        .hasMatch(email)) {
      expectedErrorMessage = "Enter a valid email address";
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      expectedErrorMessage = "enter valid following pattern password";
    } else if (email != "test@gmail.com" && password != "Test@123") {
      expectedErrorMessage = "Please enter valid email or password";
    } else if (email == "test@gmail.com" && password != "Test@123") {
      expectedErrorMessage = "Please enter valid email or password";
    } else if (email != "test@gmail.com" && password == "Test@123") {
      expectedErrorMessage = "Please enter valid email or password";
    } else if (email == "test@gmail.com" && password == "Test@123") {
      expectedErrorMessage = "Login Success";
    } else {
      expectedErrorMessage = "Please enter valid email or password";
    }
    print(expectedErrorMessage);
    expect(find.text(expectedErrorMessage), findsOneWidget);
  });
}
