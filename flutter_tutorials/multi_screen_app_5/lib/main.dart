import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "My Multi Screen App",
    debugShowCheckedModeBanner: false,
    // home: Text("Multi Pages"),
    home: ScreenA(),
  ));
}


class ScreenA extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen A"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenB()),
            );
          },
          child: const Text("Go to Screen B"),
        ),
      ),
    );
  } 
}

class ScreenB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen B"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // goes back to the previous ScreenA
          },
          child: const Text("Go to Screen A"),
        ),
      ),
    );
  } 
}

