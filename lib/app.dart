import 'package:flutter/material.dart';
import 'package:leadxpert/screens/splashScreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeadXpert',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Splashscreen(),
    );
  }
}
