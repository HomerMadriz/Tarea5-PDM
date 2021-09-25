// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:special_counter/Providers/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador v2.0"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            margin: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: context.watch<Counter>().getCurrentColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Consumer<Counter>(
                builder: (context, counter, child) {
                  return Text(
                    counter.getCount.toString(),
                    style: TextStyle(fontSize: 72, color: counter.getFontColor),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                child: Text(
                  "BLACK",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.black87,
                onPressed: () {
                  context.read<Counter>().setColor('black');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Cambiando a color negro...'),
                  ));
                },
              ),
              MaterialButton(
                child: Text(
                  "RED",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.red,
                onPressed: () {
                  context.read<Counter>().setColor('red');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Cambiando a color rojo...'),
                    backgroundColor: context.read<Counter>().getCurrentColor,
                  ));
                },
              ),
              MaterialButton(
                child: Text(
                  "BLUE",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.blue,
                onPressed: () {
                  context.read<Counter>().setColor('blue');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Cambiando a color azul...'),
                    backgroundColor: context.read<Counter>().getCurrentColor,
                  ));
                },
              ),
              MaterialButton(
                child: Text(
                  "GREEN",
                  style: TextStyle(color: Colors.grey[200]),
                ),
                color: Colors.green,
                onPressed: () {
                  context.read<Counter>().setColor('green');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Cambiando a color verde...'),
                    backgroundColor: context.read<Counter>().getCurrentColor,
                  ));
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Sumar 1 cuenta",
                  icon: Icon(Icons.add),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().increment();
                  },
                ),
              ),
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Restar 1 cuenta",
                  icon: Icon(Icons.remove),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().decrement();
                  },
                ),
              ),
              CircleAvatar(
                maxRadius: 30,
                minRadius: 20,
                child: IconButton(
                  tooltip: "Reiniciar cuenta",
                  icon: Icon(Icons.restart_alt),
                  color: Colors.grey[200],
                  onPressed: () {
                    context.read<Counter>().reset();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
