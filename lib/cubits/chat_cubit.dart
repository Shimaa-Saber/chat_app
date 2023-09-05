import 'package:chatapp/cubits/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constant.dart';
import '../models/message.dart';

class chatCubit extends Cubit<chatStates>{
  chatCubit(super.initialState);

  CollectionReference messages = FirebaseFirestore.instance.collection(
      KmessagesCollections);

  void sendmessage({required String message, required var email}){
    messages.add({
      KMessage: message,
      CreatedAt:DateTime.now(),
      'id': email,
    });
  }
  void getmessage(){
     messages.orderBy(CreatedAt, descending: true).snapshots().listen((event) {
       List<Message>message_list=[];
       for(var doc in event.docs){
         message_list.add(Message.formJson(doc));
       }
      emit(chatSuccess(messages: message_list));
    });
  }

}