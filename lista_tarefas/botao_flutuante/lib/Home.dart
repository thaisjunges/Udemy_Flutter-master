import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FloatingActionButton"),
      ),
      body: const Text("Conteudo"),

      //POSIÇÃO
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //CONFIGURAÇÕES DO ICONE
      //floatingActionButton: FloatingActionButton(

      //COM O FLOATING EXTENDED PODEMOS INSERIR ICONE COM TEXTO
      //BOTÃO FLUTUANTE
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 131, 11, 155),
        foregroundColor: Colors.black,
        //SOMBRA
        elevation: 4,
        //ICONE NO BOTÃO FLUTUANTE
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text("Adicionar"),
        //EFEITO DO BOTÃO
        //shape: BeveledRectangleBorder(
        //BORDA-TAMANHO DO BOTÃO
        //borderRadius: BorderRadius.circular(20)
      ),

      //PADRÃO DO TAMANHO
      //mini: true,
      //DEFINE O ICONE
      /*child:Icon(Icons.add),
        onPressed: (){
          print("Resultado: botão pressionado!");
        }
      ),*/
      //BOTÕES
      bottomNavigationBar: BottomAppBar(
          //DEFININDO EFEITO NO BOTÃO
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                //ICON DE MENU
                icon: const Icon(Icons.menu),
              )
            ],
          )),
    );
  }
}
