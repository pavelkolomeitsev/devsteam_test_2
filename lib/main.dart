import 'package:flutter/material.dart';

import './pages/main_page.dart';
import './pages/full_photo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devsteam test task',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),
      routes: {
        '/': (context) => MainPage(),
        FullPhotoPage.routeName: (context) => FullPhotoPage(),
      },
    );
  }
}
