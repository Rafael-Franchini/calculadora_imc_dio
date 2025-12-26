import 'package:calculadora_imc_dio/main.dart';
import 'package:test/test.dart';

void main() {
  group('Testes do Cálculo de IMC', () {
    test('Deve calcular o IMC corretamente', () {
      var pessoa = Pessoa("Fulano", 80, 2.0);
      // 80 / (2 * 2) = 20.0
      expect(pessoa.calcularIMC(), equals(20.0));
    });

    test('Deve retornar 0 se a altura for zero para evitar divisão por zero', () {
      var pessoa = Pessoa("Invalido", 70, 0);
      expect(pessoa.calcularIMC(), equals(0));
    });
  });

  group('Testes de Classificação', () {
    test('Deve classificar como Saudável (IMC 20)', () {
      var pessoa = Pessoa("Pedro", 70, 1.75); // IMC ~22.8
      expect(pessoa.classificarIMC(), equals("Saudável"));
    });

    test('Deve classificar como Magreza Grave (IMC < 16)', () {
      var pessoa = Pessoa("Ana", 35, 1.60); // IMC ~13.6
      expect(pessoa.classificarIMC(), equals("Magreza grave"));
    });

    test('Deve classificar como Obesidade Grau III (IMC >= 40)', () {
      var pessoa = Pessoa("João", 150, 1.80); // IMC ~46.3
      expect(pessoa.classificarIMC(), equals("Obesidade Grau III (mórbida)"));
    });

    test('Deve classificar como Sobrepeso (IMC entre 25 e 30)', () {
      var pessoa = Pessoa("Maria", 85, 1.80); // IMC ~26.2
      expect(pessoa.classificarIMC(), equals("Sobrepeso"));
    });
  });
}