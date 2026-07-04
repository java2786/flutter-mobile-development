import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorHomeState();
  }
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayText = "0";

  MaterialColor buildButtonColor(String label) {
    switch (label) {
      case "C":
        return Colors.blueGrey;
      case "=":
        return Colors.orange;
      case "+":
      case "-":
      case "*":
      case "/":
        return Colors.amber;
    }
    return Colors.grey;
  }

  Widget buildButton(String label) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            print("$label button clicked");
          },
          style: ElevatedButton.styleFrom(
            // backgroundColor: label=="="? Colors.orange:Colors.grey,
            backgroundColor: buildButtonColor(label),
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            label.isEmpty ? "-" : label,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonGrid() {
    return Column(
      children: [
        Row(
          children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/"),
          ],
        ),
        Row(
          children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("*"),
          ],
        ),
        Row(
          children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-"),
          ],
        ),
        Row(
          children: [
            buildButton("C"),
            buildButton("0"),
            buildButton("="),
            buildButton("+"),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Brain Mentors Calculator")),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(25),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Expanded(child: buildButtonGrid()),
        ],
      ),
    );
  }
}
