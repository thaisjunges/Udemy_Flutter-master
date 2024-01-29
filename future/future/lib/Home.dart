import 'dart:convert';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlApi = "https://blockchain.info/ticker";
  
  /*//RECEBER DADOS FUTUROS
  Future<Map> _recuperarPreco() async {
    String urlApi = "https://blockchain.info/ticker";
    http.Response response = await http.get(urlApi as Uri);
    return json.decode(response.body);
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      //DEFINE OS DADOS QUE VÃO SER CARREGADOS  //SNAPSHOT CONSEGUIMOS ACESSAR DADOS DA REQUISIÇÃO
      future: null,
      builder: (context, snapshot){

        String resultado;
        //CONECTIONSTATE CONTROLA O ESTADO DA CONEXÃO
        
        switch( snapshot.connectionState){
          case ConnectionState.none : 
          case ConnectionState.waiting :
            if (kDebugMode) {
              print("conexao waiting");
            }
            resultado = "Carregando...";
          break;
         
         case ConnectionState.active :
          case ConnectionState.done :
          if (snapshot.hasError){
            resultado = "Erro ao carregadar os dados";
          }else {
            double valor = snapshot.data?["BRL"]["buy"];
             resultado = "Preço do bitcoin: ${valor.toString()}";
            
          }
          break;
        }
         return Center(
          child: Text( resultado ),
        );
          },
         ); 
      }
  }
