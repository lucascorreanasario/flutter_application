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
      width: 50,
      height: 200,
    );
  }
  

  containerBuild1() {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.all(3),
      width: 50,
      height: 300,
    );
  }
    containerBuild2() {
    return Container(
      color: Colors.green,
      margin: const EdgeInsets.all(3),
      width: 50,
      height: 400,
    );
  }
   containerBuild3() {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.all(3),
      width: 50,
      height: 500,
    );
  }
   containerBuild4() {
    return Container(
      color: Colors.grey,
      margin: const EdgeInsets.all(3),
      width: 50,
      height: 600,
    );
  }


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar")),
         body: Container(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [containerBuild(), containerBuild1(), containerBuild2(), containerBuild3(), containerBuild4()],
        ),
      )
      )
    );
    
  }
}
