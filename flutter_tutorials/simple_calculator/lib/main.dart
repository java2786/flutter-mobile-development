import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SimpleCalculator(),
  ));
}

class SimpleCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Caculator();
  }

}

class Caculator extends State<SimpleCalculator>{
  final fn = TextEditingController();
  final sn = TextEditingController();
  int sum = 0;

  addNumbers(){
          int a = int.parse(fn.text);
          int b = 5;
          setState(() {
            sum = a + b;
          });
        }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField( controller: fn, ),
        Text("Second Number"),
        ElevatedButton(onPressed: addNumbers, child: Text("Add")),
        Text("$sum"),
      ],)
    );
  }

}