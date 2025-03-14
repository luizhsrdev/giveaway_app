import 'dart:math'; // Importa a biblioteca para gerar números aleatórios

void main() {
  var lista = [
    "Mateus Pessoa",
    "Luiz Henrique",
    "Sean Victor",
    "Guiguibo",
  ]; // Lista de pessoas para o sorteio

  var random = Random(); // Cria uma instância para gerar números aleatórios
  var indiceSorteado = random.nextInt(
    lista.length,
  ); // Gera um índice aleatório com base no tamanho da lista
  var itemSorteado =
      lista[indiceSorteado]; // Obtém a pessoa sorteada com base no índice gerado

  print("A pessoa sorteada foi: $itemSorteado"); // Exibe o resultado no console
}
