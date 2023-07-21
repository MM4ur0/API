import 'package:api/presentation/screens/api.dart';
import 'package:api/presentation/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    '/': (context) => const Login(),
    '/api': (ontext) => const Api(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Login());
      },
    );
  }
}
