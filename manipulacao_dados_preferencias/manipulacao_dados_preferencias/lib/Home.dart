

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoSalvo = "Nada Salvo";
  final TextEditingController _controllerCampo = TextEditingController();

  // SALVAR
  _salvar() async {

  //RECUPERANDO DADO DIGITADO
  String valorDigitado = _controllerCampo.text;

  //RECUPERANDO OBJETO QUE É RESPONSAVEL POR MANIPULAR AS PREFERENCIAS DO USUÁRIO
  final prefs = await SharedPreferences.getInstance();

  //SALVAR OS DADOS QUE FOI DIGITADO
  await prefs.setString("nome", valorDigitado);

  if (kDebugMode) {
    print("operacao (salvar):  $valorDigitado");

}
}

  // RECUPERAR
  _recuperar() async {
  
  //RECUPERANDO OBJETO QUE É RESPONSAVEL POR MANIPULAR AS PREFERENCIAS DO USUÁRIO
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _textoSalvo = prefs.getString("nome") ?? "Sem valor";
  });

  if (kDebugMode) {
    print("operacao (recuperar):  $_textoSalvo");
  }
}

  // REMOVER
   _remover() async {
  //RECUPERANDO OBJETO QUE É RESPONSAVEL POR MANIPULAR AS PREFERENCIAS DO USUÁRIO
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("nome");

  if (kDebugMode) {
    print("operacao (remover) ");
  }
}

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manipulação de dados"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
             _textoSalvo,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Digite algo:"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                    _salvar();
                  },
                  child: const Text("Salvar"),
                  ),
                const Padding(padding: EdgeInsets.all(10)
                ),
                ElevatedButton(
                  onPressed: (){
                    _recuperar();
                  },
                  child: const Text("Recuperar")
                  ),
                  const Padding(padding: EdgeInsets.all(10)
                ),
                ElevatedButton(
                  onPressed: (){
                    _remover();  
                  }, 
                  child: const Text("Remover")
                  ),
              ],
              
            )
          ],
        ),
      ),
    );
  }
}