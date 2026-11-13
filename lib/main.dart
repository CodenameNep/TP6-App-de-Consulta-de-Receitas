// Leandro Andrade dos Santos

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaReceitas(),
    );
  }
}

class TelaReceitas extends StatefulWidget {
  const TelaReceitas({super.key});

  @override
  State<TelaReceitas> createState() => _TelaReceitasState();
}

class _TelaReceitasState extends State<TelaReceitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas - Leandro Andrade dos Santos'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
