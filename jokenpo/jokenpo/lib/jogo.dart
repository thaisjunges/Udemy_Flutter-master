// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  //VARIAVEL
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  //METODO  
  void _opcaoSelecionada(String escolhaUsuario){

    //ARRAY
    var opcoes = ["pedra", "papel", "tesoura"];

    //NUMERO DE OPÇOES
    var numero = Random().nextInt(3);

    //ESCOLHA DO APP
    var escolhaApp = opcoes[numero];

    //EXIBE OPÇÃO DE ESCOLHA
    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuario: " + escolhaUsuario);

    //EXIBIÇÃO DA IMAGEM ESCOLHIDA PELO APP
    switch( escolhaApp ){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
        case "papel" :
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
        case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //VALIDAÇÃO DO USUÁRIO GANHADOR
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") || 
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") || 
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      //MENSAGEM DE USUÁRIO GANHAR 
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou";
      });

      //VALIDAÇÃO DO APP GANHADOR
    }else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") || 
      (escolhaApp == "tesoura" && escolhaUsuario == "papel")  ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      //MENSAGEM DE PERDA DO APP 
       setState(() {
        this._mensagem = "Você perdeu";
      });
    }else{

      //SE EMPATAR
        setState(() {
        this._mensagem = "Você empatou";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        //CENTRALIZANDO CONTEUDO
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          //LINHA HORIZONTAL
          Row(
            //ALINHAMENTO ENTRE AS IMAGENS
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child:Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child:Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child:Image.asset("images/tesoura.png", height: 100),
              ),
              ],
          )
        ],
      ),
    );
  }
}