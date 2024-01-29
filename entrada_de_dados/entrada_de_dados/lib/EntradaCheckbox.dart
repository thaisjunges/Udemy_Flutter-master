import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  
  //ATRIBUTO BOLEANO COM VALOR INICIAL FALSE
  bool _estaSelecionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Comida Brasileira"),
            Checkbox(
              value: _estaSelecionado,
              onChanged: (bool? valor) 
              {
                //MUDAR O _estaSelecionado p/ TRUE
                setState(() {
                  _estaSelecionado = valor!;
                });
                //CONVERTE O BOLEANO PARA STRING
                print("Checkbox: " + valor.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}