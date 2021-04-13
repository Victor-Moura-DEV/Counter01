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

  void operacao(bool eSoma) {
    if (eSoma) {
      setState(() {
        resultado += 1;
      });
    } else {
      setState(() {
        resultado -= 1;
      });
    }
  }

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
          buildFloatingActionBottom(
            Icons.remove,
            resultado == 0
                ? null
                : () {
                    operacao(false);
                  },
            backgroundColor: resultado == 0 ? Colors.grey : Colors.red,
          ),
          buildFloatingActionBottom(
            Icons.add,
            () {
              operacao(true);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionBottom(
      IconData icon, Function pressed,
      {Color backgroundColor}) {
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      onPressed: pressed,
      child: Icon(icon),
    );
  }
}
