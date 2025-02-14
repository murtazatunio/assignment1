import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home_page.dart';
import 'widgets/bunny_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bunny Search SearchBar Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage());
  }
}
