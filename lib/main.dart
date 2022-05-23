import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (_) => const HomeScreen(),
        'DatailsScreen': (_) => const DetailsScreen(),
      },
      theme: ThemeData.light(),
    );
  }
}
