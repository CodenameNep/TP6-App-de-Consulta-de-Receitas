// Leandro Andrade dos Santos

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List receitas = [];
  bool carregando = false;
  String mensagem = '';

  Future<void> _consultarReceita() async {
    final termo = receitaController.text.trim();
    if (termo.isEmpty) return;

    setState(() {
      carregando = true;
      mensagem = '';
      receitas = [];
    });

    final url = Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$termo');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final dados = jsonDecode(response.body);
        setState(() {
          carregando = false;
          receitas = dados['meals'] ?? [];
          if (receitas.isEmpty) {
            mensagem = 'Nenhuma receita encontrada';
          }
        });
      } else {
        setState(() {
          carregando = false;
          mensagem = 'Erro ao consultar API';
        });
      }
    } catch (e) {
      setState(() {
        carregando = false;
        mensagem = 'Erro de conexao';
      });
    }
  }

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
          const SizedBox(height: 16),
          _status(),
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

  Widget _status() {
    if (carregando) {
      return const CircularProgressIndicator();
    }
    if (mensagem.isNotEmpty) {
      return Text(mensagem);
    }
    return Container();
  }
}
