import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    title: "My Multi Screen App",
    debugShowCheckedModeBanner: false,
    // home: Text("Multi Pages"),
    home: ScreenA(),
  ));
}


class ScreenA extends StatelessWidget{

  void setValue() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", "24.6");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen A"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setValue();
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
  
  String? hero = "Bat-man";

  void readValue() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();    
      hero = prefs.getString("name");
      print("Hero: $hero");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen B"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          readValue();
            // Navigator.pop(context); // goes back to the previous ScreenA
          },
          child: const Text("Go to Screen A"),
        ),
      ),
    );
  } 
}

