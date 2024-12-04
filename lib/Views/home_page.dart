import 'package:avaliacao/Views/Widgets/container_personalizado.dart';
import 'package:avaliacao/util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int opcao = 0;
  String? senha;
  final senhaController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerPersonalizado(
                  color: opcao == 0 ? Colors.grey[700] : theme.cardColor,
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          opcao = 0;
                        },
                      );
                    },
                    child: Text('Senha numerica',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                ContainerPersonalizado(
                  color: opcao == 1 ? Colors.grey[700] : theme.cardColor,
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          opcao = 1;
                        },
                      );
                    },
                    child: Text(
                      'Senha textual',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 250,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: senhaController,
                autovalidateMode: AutovalidateMode.onUnfocus,
                decoration: InputDecoration(
                  labelText: 'Quantidade de caracteres da senha',
                  labelStyle: TextStyle(
                    color: Colors.black
                  ),
                  disabledBorder: OutlineInputBorder(),
                ),
                validator: (value){
                  if (value == null) {
                    return 'Campo não pode ser nulo';
                  }
                  List numeros = List.generate(10, (int index)=> index.toString()).join().codeUnits;
                  List charValue = value.codeUnits;
                  
                  if (!charValue.any((element)=> numeros.contains(element))) {
                    return 'Só é permitido numeros';
                  }
                  if (int.parse(value) <3) {
                    return 'numero minimo é 3';
                  }
                  return null;
                },
              ),
            ),
            ContainerPersonalizado(
              color: theme.cardColor,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(
                      () {
                        senha = gerarSenha(
                          opcao: opcao,
                          qntCaracteres: int.parse(senhaController.text),
                        );
                      },
                    );
                  }
                },
                child:
                    Text('Gerar senha', style: TextStyle(color: Colors.black)),
              ),
            ),
            Text(
              'Senha: $senha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
