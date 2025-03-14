import 'dart:math'; // Importa a biblioteca para gerar números aleatórios
import 'package:flutter/material.dart'; // Importa o Flutter Material Design

void main() {
  runApp(SorteioApp()); // Inicia o aplicativo Flutter
}

class SorteioApp extends StatelessWidget {
  const SorteioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SorteioHome(), // Define a tela inicial do aplicativo
      debugShowCheckedModeBanner: false, // Remove o banner de debug
    );
  }
}

class SorteioHome extends StatefulWidget {
  const SorteioHome({super.key});

  @override
  _SorteioHomeState createState() => _SorteioHomeState(); // Cria o estado da tela
}

class _SorteioHomeState extends State<SorteioHome> {
  var lista = [
    "Mateus Pessoa",
    "Luiz Henrique",
    "Sean Victor",
    "Guiguibo",
  ]; // Lista de pessoas para o sorteio
  String itemSorteado =
      'Clique para sortear alguém!'; // Mensagem inicial exibida na tela

  void sortearPessoa() {
    var random = Random(); // Cria uma instância para gerar números aleatórios
    var indiceSorteado = random.nextInt(
      lista.length,
    ); // Gera um índice aleatório com base no tamanho da lista
    var pessoaSorteada =
        lista[indiceSorteado]; // Obtém a pessoa sorteada com base no índice gerado

    setState(() {
      itemSorteado =
          "A pessoa sorteada foi: $pessoaSorteada"; // Atualiza o texto exibido na tela
    });

    print(itemSorteado); // Exibe o resultado no console (opcional)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteador de Pessoas'), // Título da AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza os elementos verticalmente
          children: [
            Text(
              itemSorteado, // Exibe o texto atual (inicial ou o resultado do sorteio)
              style: TextStyle(fontSize: 24), // Define o tamanho da fonte
              textAlign: TextAlign.center, // Centraliza o texto horizontalmente
            ),
            SizedBox(height: 30), // Espaçamento entre o texto e o botão
            ElevatedButton(
              onPressed:
                  sortearPessoa, // Define a função chamada ao pressionar o botão
              child: Text('Sortear!'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}
