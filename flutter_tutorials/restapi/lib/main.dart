import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// class DataService {
//   final http.Client client;

//   DataService({http.Client? client}) : client = client ?? http.Client();

//   Future<String> fetchData(String url) async {
//     var response = await client.get(Uri.https(url, 'data.json'));
//     return jsonDecode(response.body)["username"];
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 1;
  String name = "None";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
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
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: () async {
              // https://jsonplaceholder.typicode.com/users/3
              // DataService dataService = DataService();
              // var res = dataService.fetchData("https://jsonplaceholder.typicode.com/users/3");
              // print(res);
              var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/$_counter"));
              var data = jsonDecode(response.body);
              // print(data["name"]);
              setState(() {
                name = data["name"];
              });
            }, child: Text("API")),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: _decrementCounter, child: const Icon(Icons.add_home))
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
