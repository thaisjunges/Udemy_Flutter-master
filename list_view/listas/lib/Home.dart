import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List _itens = [];

   void _carregarItens(){

    _itens = [];
    for(int i=0; i<=10; i++){
       Map<String, dynamic> item = {};
        item["titulo"] = "Filme $i Mundo";
        item["descricao"] = "Terror $i Mundo";
        _itens.add(item);
 
    }

  }

  @override
  Widget build(BuildContext context) {

   _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice){

            //Map<String, dynamic> item = _itens[indice];
            //print("item ${_itens[indice]["titulo"] }");
            
            return ListTile(
              onTap: (){
                print("Clique com onTap ${indice}");
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.teal
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      actions: [
                        ElevatedButton(
                          onPressed: (){
                            print("Selecionado sim");
                            Navigator.pop(context);
                          }, 
                          child: const Text("Sim")
                          ),
                          ElevatedButton(
                          onPressed: (){
                            print("Selecionado não");
                            Navigator.pop(context);
                          }, 
                          child: const Text("Não")
                          )
                      ],
                      //backgroundColor: Colors.green,
                    );
                  }
                  );
              },
              /*onLongPress: (){
                print("Clique com o onLongPress");
              },*/
              title: Text( _itens[indice]["titulo"] ),
              subtitle: Text( _itens[indice]["descricao"] ),
            );
          },
      ),
    ));
  }
}