import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //FRASES A SEREM GERADAS
  var _frases = [
    "As dificuldades existem para separar o belo do extraordinário.",
    "O amor não se vê com os olhos mas com o coração.",
    "Só sei que nada sei.",
    "O inverno cobre minha cabeça, mas uma eterna primavera vive em meu coração"
  ];

//GERAR FRASE
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      //PEGANDO O ARRAY DE FRASES E DEFININDO O NUMERO SORTEADO
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases do dia'),
        backgroundColor: Color.fromARGB(255, 207, 194, 6),
      ),
      body: Center(
          child: Container(
        //padding: EdgeInsets.all(16),
        /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.yellow)
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo_frases.png"),
            Text(
              //GERAR FRASE
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            ElevatedButton(
              child: Text(
                "Nova Frase",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _gerarFrase,
            )
          ],
        ),
      )),
    );
  }
}
