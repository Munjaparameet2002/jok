import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class jok3 extends StatefulWidget {
  List arre;
  int index;
  jok3(this.arre,this.index);
  @override
  State<jok3> createState() => _jok3State();
}

class _jok3State extends State<jok3> {
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JOKES"),),
      body: Column(children: [
        IconButton(onPressed: () {
          }, icon: Icon(Icons.share)),
        IconButton(onPressed: () {
            {
              widget.index++;
              controller.jumpToPage(widget.index);
              setState(() {

              });
            }
        }, icon: Icon(Icons.arrow_forward_ios)),
        PageView.builder(itemBuilder: (context, index) {
          return Text("${widget.arre[index]}");
        },)
      ],),

    );
  }
}
