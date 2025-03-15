import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SorteioScreen());
  }
}

class SorteioScreen extends StatefulWidget {
  const SorteioScreen({super.key});

  @override
  _SorteioScreenState createState() => _SorteioScreenState();
}

class _SorteioScreenState extends State<SorteioScreen> {
  List<String> participantes = [
    'Luiz Henrique, João Veras, Sean Victor, Guilherme Ancheschi, Heitor Macedo',
  ];
  List<String> vencedores = [];
  String vencedorAtual = '';

  void sortearVencedor() {
    if (participantes.isNotEmpty) {
      final random = Random();
      int index = random.nextInt(participantes.length);
      setState(() {
        vencedorAtual = participantes[index];
        vencedores.add(vencedorAtual);
        participantes.removeAt(index);
      });
    } else {
      setState(() {
        vencedorAtual = 'Todos já venceram!';
      });
    }
  }

  void reiniciarSorteio() {
    setState(() {
      participantes = [
        'Luiz Henrique, João Veras, Sean Victor, Guilherme Ancheschi, Heitor Macedo',
      ];
      vencedores.clear();
      vencedorAtual = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorteio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              vencedorAtual.isEmpty
                  ? 'Clique em "Sortear" para escolher um vencedor!'
                  : 'Vencedor: $vencedorAtual',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: sortearVencedor, child: Text('Sortear')),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: reiniciarSorteio,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cor do botão
              ),
              child: Text('Reiniciar Sorteio'),
            ),
            SizedBox(height: 20),
            Text('Histórico de Vencedores:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: vencedores.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(vencedores[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
