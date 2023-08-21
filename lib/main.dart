import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({
    super.key
  });

  @override
  State < MyApp > createState() => _MyAppState();
}
containerBuild() {
  return Container(
      color: Colors.red,
     margin: const EdgeInsets.only(left: (40), bottom: (10), top: (10), right: (40)),
      width: 50,
      height: 120,
  );
}
containerBuild2() {
  return Container(
    color: Colors.red,
    width: 100,
    height: 14,
  );
}




class _MyAppState extends State < MyApp > {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar")),
        body: Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                containerBuild(),
                containerBuild2(),
                containerBuild(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                containerBuild(),
                containerBuild2(),
                containerBuild(),
              ],
            ),
            Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,



              children: [

                containerBuild(),
                containerBuild2(),
                containerBuild(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}