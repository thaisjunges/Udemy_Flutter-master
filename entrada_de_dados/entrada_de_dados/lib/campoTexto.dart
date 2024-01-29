// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de dados"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                //CAMPO DE TEXT, NUMBER, EMAIL, DATETIME
                keyboardType: TextInputType.number,
                //PLACEHOLDER QUE VAI APAECER PARA O USUARIO
                decoration: InputDecoration(
                  labelText: "Digite um valor"
                ),
                //HABILITADO E DESABILITADO(FALSE) NÃO CONSEGUE DIGITAR
                //enabled: true,
                //MAXIMO DE CARACTERES P/USUARIO DIGITAR
                //maxLength: 2,
                //maxLengthEnforcement: MaxLengthEnforcement.none,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green, 
                ),
                obscureText: true,
                /*//RECUPERA O VALOR DIGITADO PELO USUÁRIO
                onChanged: (String texto){
                  print("valor digitado:" + texto);*/
                  onSubmitted: (String texto){
                    // ignore: prefer_interpolation_to_compose_strings
                    print("valor digitado:" + texto);
                },
                //CONTROLADOR DO CAMPO DE TEXTO
                controller: _textEditingController,
              ),
            ),
            ElevatedButton(
              //TEXTO DO BOTAO
              child:Text(
                "Salvar"
                 ),
                 //COR DE FUNDO
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                 ),
                 onPressed: (){
                  print("Valor digitado:" + _textEditingController.text);
                 },
              )
          ],
        ));
  }
}
