import 'package:flutter/material.dart';
import 'package:flutter_testing/widget_test/utils/database.dart';
import 'package:flutter_testing/widget_test/utils/user.dart';
import 'package:provider/provider.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  static String routeName = "/addUser";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add User")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _firstNameController,
              key: const Key("firstNameKey"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "First Name",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17, vertical: 0),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _lastNameController,
              key: const Key("lastNameKey"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last Name",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17, vertical: 0),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                key: Key("addUserBtn"),
                  onPressed: () {
                    if (_firstNameController.text.isEmpty ||
                        _lastNameController.text.isEmpty) return;
                    Database database =
                        Provider.of<Database>(context, listen: false);
                    User user = User(
                        _firstNameController.text, _lastNameController.text);

                    database.addNewUser(user).then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 5),
                                content: Text("User added successfully"),
                                backgroundColor: Colors.green)));

                    _firstNameController.clear();
                    _lastNameController.clear();
                  },
                  child: const Text("ADD USER")),
            )
          ],
        ),
      ),
    );
  }
}
