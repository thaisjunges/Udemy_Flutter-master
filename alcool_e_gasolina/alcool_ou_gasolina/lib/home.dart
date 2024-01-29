// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //PREÇO ALCOOL
  TextEditingController _controllerAlcool = TextEditingController();
  //PREÇO GASOLINA
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    //CONVERSÃO PARA DOUBLE E RECUPERA O VALOR DO CAMPO PREÇO ALCOOL COMO TEXTO
    double precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(",", ".")) ?? 0.0;
    double precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(",", ".")) ?? 0.0;

    if (precoAlcool == 0.0 || precoGasolina == 0.00) {
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0";
      });
    } else {
      
      /* Se o preço do álcool divido pelo preço da gasolina
      for >= a 0.7 é melhor abastecer com gasolina senão é melhor
      utilizar álcool
      * */

      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com Álcool";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Álcool e Gasolina"),
        ),
        body: Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: Image.asset("images/logo.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                          "Saiba qual a melhor opção para abastecimento do seu carro"),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Preço Álcool, ex 1.59"),
                      controller: _controllerAlcool,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Preço Gasolina, ex 3.15",
                      ),
                      controller: _controllerGasolina,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        child: Text("Calcular"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: _calcular,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(_textoResultado,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    )
                  ])),
        ));
  }
}
