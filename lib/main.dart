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
          BottomCount(
            icon: Icon(Icons.remove),
            pressed: resultado == 0
                ? null
                : () {
                    operacao(false);
                  },
            backgroundColor: resultado == 0 ? Colors.grey : Colors.red,
          ),
          BottomCount(
            icon: Icon(Icons.add),
            pressed: () {
              operacao(true);
            },
          ),
        ],
      ),
    );
  }
}

class BottomCount extends StatefulWidget {
  final Color backgroundColor;
  final Function pressed;
  final Widget icon;

  const BottomCount({Key key, this.backgroundColor, this.pressed, this.icon})
      : super(key: key);
  @override
  _BottomCountState createState() => _BottomCountState();
}

class _BottomCountState extends State<BottomCount> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: widget.backgroundColor,
      onPressed: widget.pressed,
      child: widget.icon,
    );
  }
}
