import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
 containerBuild() {
    return Container(
      color: Colors.yellow,
      margin: const EdgeInsets.all(3),
      width: 100,
      height: 50,
    );
  }

  containerBuild1() {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.all(3),
      width: 200,
      height: 50,
    );
  }
    containerBuild2() {
    return Container(
      color: Colors.green,
      margin: const EdgeInsets.all(3),
      width: 300,
      height: 50,
    );
  }
   containerBuild3() {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.all(3),
      width: 400,
      height: 50,
    );
  }


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: 
          [containerBuild(), containerBuild1(), containerBuild2(), containerBuild3()],
        ),
      )
    );
    
  }
}
