import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
   button({required this.color,required this.button_text, this.onTap});
 Color? color;
 String button_text;
 VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: onTap,
      child: Container(

        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.green,Colors.teal,Colors.greenAccent]),
            color: color,
            borderRadius: BorderRadius.circular(16)),
        child: Center(
            child: Text(button_text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87),)),
      ),
    );
  }
}
