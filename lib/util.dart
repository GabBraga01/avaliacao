import 'dart:math';

String gerarSenha({required int opcao, required int qntCaracteres}) {
  List senha = [];
  for (var i = 0; i < qntCaracteres; i++) {
    String numeros = String.fromCharCode(Random().nextInt(9) + 48);
    String letrasMaisculas = String.fromCharCode(Random().nextInt(25) + 65);
    String letrasMinusculas = String.fromCharCode(Random().nextInt(25) + 97);

    if (opcao == 0) {
      senha.add(numeros);
    } else {
      switch (Random().nextInt(3)) {
        case 0:
          senha.add(numeros);
          break;
        case 1:
          senha.add(letrasMaisculas);
          break;
        default:
          senha.add(letrasMinusculas);
          break;
      }
    }
  }

  return senha.join();
}
