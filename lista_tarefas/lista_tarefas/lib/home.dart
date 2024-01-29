import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //CRIANDO LISTA DE TAREFAS
  List _listaTarefas = [];

  Future<File> _getFile() async {
    //CHAMA O METODO QUE RETORNA O OBJ DIRECTORY QUE MOSTRA O CAMINHO DO PARA SALVAR O ARQUIVO
    final diretorio = await getApplicationDocumentsDirectory();
    //CRIANDO ARQUIVO VAZIO CHAMADO "DADOS" PARA RECUPERAR O DIRETORIO
    return File("${diretorio.path}daddos.json/");
  }

  //PEGA A LISTA DE TAREFAS E SALVA NO ARQUIVO
  _salvarArquivo() async {
    var arquivo = await _getFile();
    //CRIAR DADOS
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = "Tomar café";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    //SALVANDO LISTA INTEIRA
    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
    /*if (kDebugMode) {
      print("Caminho: ${diretorio.path}");
    }*/
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
    if (kDebugMode) {
      print(("items:$_listaTarefas"));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: const Color.fromARGB(255, 118, 14, 136),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
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
                    actions: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancelar")),
                      ElevatedButton(
                          //SALVAR
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //PEGANDO TODO O TAMANHO DA LISTA
              itemCount: _listaTarefas.length,
              //CONMSTRUINDO O ITEM PARA FAZER A EXIBIXÇÃO DE CADA ITEM
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  //ACESSANDO O INDICE DO ITEM
                  title: Text(_listaTarefas[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
