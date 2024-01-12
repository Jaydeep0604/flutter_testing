import 'package:flutter/material.dart';
import 'package:flutter_testing/login/login_screen.dart';
import 'package:flutter_testing/widget_test/active-users.dart';
import 'package:flutter_testing/widget_test/add_users.dart';
import 'package:flutter_testing/widget_test/archived_users.dart';
import 'package:flutter_testing/widget_test/utils/database.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final Widget? child;
  const MyApp({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Database(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          initialRoute: '/',
          // routes: {
          //   "/": (context) => child ?? const ActiveUsers(),
          //   "/addUser": (context) => AddUser(),
          //   "/archive": (context) => const ArchivedUsers(),
          // },
          home: LoginScreen(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text("test"),)
          ],
        ),
      ),
    );
  }
}

enum Source { active, archived }
