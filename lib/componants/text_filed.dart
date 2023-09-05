import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  TextF({required this.hint,required this.icon,this.onchanged,this.obscure=false});
  String hint;
  IconData icon;
  Function(String)?onchanged;
  bool obscure;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText:obscure ,
      validator: (data){
        if(data!.isEmpty){
          return ' this filed is required';
        }

      },
      onChanged: onchanged,
      decoration: InputDecoration(


          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          prefix: Icon(icon,color:  Colors.white,),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(

                color: Colors.white,

                strokeAlign: 1

              )

          ),
          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(20),

          )

      ),
    );
  }
}
