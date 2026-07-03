import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    debugShowCheckedModeBanner: false,
    // home: HomePage()
    home: Counter()
  ));
}

class Counter extends StatefulWidget{
  const Counter({super.key});

  @override
  State<Counter> createState() {
    return _CounterState();
  }
  
}

class _CounterState extends State<Counter>{
  int count = 12;
  
  void increase(){
    // count = count + 1;
    setState((){
      count = count + 1;
    });
    print("(((((((((((((((((((())))))))))))))))))))");
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App bar"),),
      body: Column(
        children: [
          Text("This is body again ${count.toString()}"),
          ElevatedButton(onPressed: increase, child: Text("Increase"))
        ],
      )
    );
  }

}


class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // return Text("Hello");
    return Scaffold(
      appBar: AppBar(title: Text("App bar"),),
      body: Center(
        child: Text("This is body"),
      ),
    );
  }
  
}
