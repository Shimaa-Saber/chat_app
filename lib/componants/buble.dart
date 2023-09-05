import 'package:chatapp/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buble extends StatelessWidget {
   buble ({required this.Mss});
 //String? text;
final Message Mss;
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(

            padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              color: Colors.teal,
            ),
            child: Text(
                    Mss.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class buble_frend extends StatelessWidget {
  buble_frend ({required this.Mss});
  //String? text;
  final Message Mss;
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(

            padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
              color: Colors.grey,
            ),
            child: Text(
              Mss.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}