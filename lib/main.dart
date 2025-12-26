import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) return 0;
    return peso / (altura * altura);
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 16) return "Magreza grave";
    if (imc < 17) return "Magreza moderada";
    if (imc < 18.5) return "Magreza leve";
    if (imc < 25) return "Saudável";
    if (imc < 30) return "Sobrepeso";
    if (imc < 35) return "Obesidade Grau I";
    if (imc < 40) return "Obesidade Grau II (severa)";
    return "Obesidade Grau III (mórbida)";
  }
}

void main() {
  print("--- Desafio IMC ---");

  try {
    stdout.write("Digite o nome: ");
    String? nome = stdin.readLineSync();
    if (nome == null || nome.isEmpty) throw Exception("Nome inválido!");

    stdout.write("Digite o peso (kg): ");
    double? peso = double.tryParse(stdin.readLineSync() ?? "");

    stdout.write("Digite a altura (m): ");
    double? altura = double.tryParse(stdin.readLineSync() ?? "");

    if (peso == null || altura == null || peso <= 0 || altura <= 0) {
      throw FormatException("Peso e altura devem ser números válidos e maiores que zero.");
    }

    var pessoa = Pessoa(nome, peso, altura);

    double resultadoImc = pessoa.calcularIMC();
    print("\n--- Resultado ---");
    print("Nome: ${pessoa.nome}");
    print("IMC: ${resultadoImc.toStringAsFixed(2)}");
    print("Classificação: ${pessoa.classificarIMC()}");

  } catch (e) {
    print("\n[ERRO]: ${e.toString()}");
  } finally {
    print("\nPrograma finalizado.");
  }
}