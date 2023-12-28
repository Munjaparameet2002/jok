import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokes/jok2.dart';
import 'package:jokes/jokes.dart';

void main() {
  runApp(MaterialApp(
    home: jokess(),
    debugShowCheckedModeBanner: false,
  ));
}

class jokess extends StatefulWidget {
  const jokess({super.key});

  @override
  State<jokess> createState() => _jokessState();
}

class _jokessState extends State<jokess> {
  List temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = List.filled(jokes.name.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
                "JOKES",
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ))),
      body: ListView.builder(
        itemCount: jokes.name.length,
        itemBuilder: (context, index) {
          return GestureDetector(onTapDown: (details) {

            temp[index] = true;
            setState(() {});
          },
          onTapUp: (details) {

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return jok2(index);
          },));
          temp[index] = false;
          setState(() {});
          },
          onTapCancel: () {

            temp[index]= true;
            setState(() {});
          },
            child: ListTile(
              tileColor: (temp[index]) ? Colors.teal : null,
              title: Text("${jokes.name[index]}"),
            ),
          );
        },
      ),
    );
  }
}
