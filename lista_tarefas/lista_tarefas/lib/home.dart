import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //CRIANDO LISTA DE TAREFAS
  List _listaTarefas = [];

  Future<File> _getFile() async {
    //CHAMA O METODO QUE RETORNA O OBJ DIRECTORY QUE MOSTRA O CAMINHO DO PARA SALVAR O ARQUIVO
    final diretorio = await getApplicationDocumentsDirectory();
    //PARA RECUPERAR OS DADOS DO DIRETORIO
    return File("${diretorio.path}/dados.json");
  }

  //PEGA A LISTA DE TAREFAS E SALVA NO ARQUIVO
  _salvarArquivo() async {
    var arquivo = await _getFile();

    //CRIAR DADOS
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = "Ir ao mercado";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    //SALVANDO LISTA INTEIRA
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);

    //print("Caminho: " + diretorio.path );
  }

  _lerArquivo() async {
    //TENTAR FAZER A EXECUÇÃO
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //_salvarArquivo();
    print("itens: " + _listaTarefas.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      decoration:
                          const InputDecoration(labelText: "Digite sua tarefa"),
                      onChanged: (text) {},
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text("Cancelar"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                        child: const Text("Salvar"),
                        onPressed: () {
                          //salvar

                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          }),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_listaTarefas[index]['titulo']),
                  );
                }),
          )
        ],
      ),
    );
  }
}
