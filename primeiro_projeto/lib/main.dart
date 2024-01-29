import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        // CORES NAV
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nomes Aletórios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _numeroAleatorio = 0;
  List _nomes = [
    'Alice',
    'Sabrina',
    'Patricia',
    'Veronica'
  ];

  void _incrementCounter() {
    setState(() {

     _numeroAleatorio = new Random().nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pressione o botão para gerar um nome:',
            ),
            Text(
             _nomes[_numeroAleatorio] ,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
