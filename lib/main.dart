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
  final TextEditingController receitaController = TextEditingController();

  void _consultarReceita() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas - Leandro Andrade dos Santos'),
        centerTitle: true,
      ),
      body: _corpo(),
    );
  }

  Widget _corpo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _campo(),
          const SizedBox(height: 16),
          _botao(),
        ],
      ),
    );
  }

  Widget _campo() {
    return TextField(
      controller: receitaController,
      decoration: const InputDecoration(
        labelText: 'Digite o nome da receita',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _botao() {
    return ElevatedButton(
      onPressed: _consultarReceita,
      child: const Text('Consultar'),
    );
  }
}
