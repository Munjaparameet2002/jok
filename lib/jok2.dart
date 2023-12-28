import 'package:flutter/material.dart';
import 'package:jokes/jok3.dart';
import 'package:jokes/jokes.dart';

class jok2 extends StatefulWidget {

  int pos;

  jok2(this.pos);

  @override
  State<jok2> createState() => _jok2State();
}

class _jok2State extends State<jok2> {
  List arr = [];
  List temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.pos) {
      case 0:
        arr = jokes.jokes1;
        break;
      case 1:
        arr = jokes.status;
        break;
    }
    ;
    temp = List.filled(jokes.jokes1.length, false);
    temp = List.filled(jokes.status.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "WEL COMOE IN  NEXT SLIDE",
            style: TextStyle(color: Colors.pinkAccent),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown: (details) {
                temp[index] = true;
                setState(() {});
              },
              onTapUp: (details) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return jok3(arr,index);
                  },
                ));
                temp[index] = false;
                setState(() {});
              },
              onTapCancel: () {
                temp[index] = false;
                setState(() {});
              },
              child: Card(
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.yellow,
                            blurRadius: 25,
                            spreadRadius: 2),
                        // BoxShadow(
                        //     color: Colors.yellow,
                        //     blurRadius: 25,
                        //     spreadRadius: 2)
                      ]),
                      child: ListTile(
                        tileColor:
                            (temp[index] ? Colors.tealAccent : Colors.orange),
                        title: Text("${arr[index]}",maxLines: 3
                          ,),
                      ))),
            );
          },
        ));
  }
}
