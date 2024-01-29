import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //COMUNICAÇÃO SÍNCRONA E ASSINCRONA //async ASSINCRONA
  _recuperarCep() async {
    //String cep = "90430001";

    //API
    String url =
        'https://viacep.com.br/ws/90430000/json/';
    http.Response response;

    //AWAIT PARA AGUARDAR O RESPONSE
    response = await http.get(Uri.parse(url));
    Map<dynamic, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    /*String nomeFantasia = retorno["NOME FANTASIA"];
    String razaoSocial = retorno["RAZAO SOCIAL"];
    String cnpj = retorno["CNPJ"];
    String dataAbertura = retorno["DATA ABERTURA"];
    String cep = retorno["CEP"];
    String logradouro = retorno["LOGRADOURO"];
    String numero = retorno["NUMERO"];
    String bairro = retorno["BAIRRO"];
    String municipio = retorno["MUNICIPIO"];*/

    print(
      "Resposta: Logradouro: ${logradouro} Complemento: ${complemento} Bairro: ${bairro} Localidade:${localidade}" 
    );
    /*print(
      "Resposta: Nome Fantasia: ${nomeFantasia} Social: ${razaoSocial}  CNPJ: ${cnpj} Data Abertura: ${dataAbertura} CEP: ${cep} Logradouro: ${logradouro} Numero: ${numero} Bairro: ${bairro} Municipio: ${municipio}");
*/

    //status.Code NÃO É UMA STRING E PRECISAMOS CONVERTER UTILIZANDO toString()
    //print("resposta: " + response.statusCode.toString());

    //body JÁ VEM COMO STRING POR PADRÃO
    /*print("resposta: " + response.body);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Consumo de serviço web")),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: _recuperarCep, child: Text("Clique aqui"))
            ],
          ),
        ));
  }
}
