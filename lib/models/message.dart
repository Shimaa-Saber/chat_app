import 'package:chatapp/constants/constant.dart';
import 'package:flutter/services.dart';

class Message {
  final String text;
  final String? id;

  Message(this.text,this.id);
  factory Message.formJson(jsonData){
    return Message(jsonData[KMessage], jsonData['id'] );
  }
}
