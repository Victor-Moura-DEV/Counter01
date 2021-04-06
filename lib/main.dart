import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CounterScreen(),
    ),
  );
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Contador'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Você pressionou o botão:',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Center(
            child: Text(
              '$resultado',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: resultado == 0
                ? null
                : () {
                    print('Botão pressionado');
                    setState(() {
                      resultado -= 1;
                    });
                  },
            child: Icon(Icons.remove),
            backgroundColor: resultado == 0 ? Colors.grey : Colors.blue,
          ),
          FloatingActionButton(
            onPressed: () {
              print('Botão pressionado');
              setState(() {
                resultado += 1;
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
