import 'package:flutter/material.dart';
import 'package:nomeando_rotas/TelaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/secundaria" : (context) => TelaSecundaria(),
    },
    //home: TelaSecundaria(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Ir para a segunda tela"),
              onPressed: (){
              Navigator.pushNamed(context, "/secundaria");
              }
            )
          ],
        ),
      ),
    );
  }
}

