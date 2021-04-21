import 'package:flutter/material.dart';
import 'counter_controller.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final controller = CounterController();

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
              controller.getCounter(),
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
              pressed: () {
                setState(() {
                  controller.subtractCounter();
                });
              }),
          BottomCount(
            icon: Icon(Icons.add),
            pressed: () {
              setState(() {
                controller.incrementCounter();
              });
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
