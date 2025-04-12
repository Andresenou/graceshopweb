import 'package:flutter/material.dart';
import 'pages/policy_page.dart';
import 'pages/contact_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNIVSHOP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PolicyPage(), // Page d'accueil : règles politiques
      routes: {
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}