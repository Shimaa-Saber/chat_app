import 'package:chatapp/componants/buble.dart';
import 'package:chatapp/constants/constant.dart';
import 'package:chatapp/cubits/chat_cubit.dart';
import 'package:chatapp/cubits/chat_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/message.dart';
import '../models/message.dart';
import '../models/message.dart';

class chat extends StatelessWidget {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
   final _controller=ScrollController();
  TextEditingController contruler = TextEditingController();



   static String id = 'ChatPage';
   List<Message> message_list=[];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments ;


            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: Colors.teal,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(Klogo), height: 70,),
                      Text('chat')
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    BlocConsumer<chatCubit,chatStates>(

                      listener: (context,state){
                        if(state is chatSuccess){
                      message_list=state.messages;
                        }
                      },
                      builder: (context,state)=>
                   Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: message_list.length,
                          itemBuilder: (context, index) {
                            return message_list[index].id == email?  buble(
                              Mss: message_list[index],
                            ) : buble_frend(Mss: message_list[index]);

                        },),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: contruler,
                        onFieldSubmitted: (data) {
                        BlocProvider.of<chatCubit>(context).sendmessage(message: data, email: email);
                          contruler.clear();
                          _controller.animateTo(0,
                              duration: Duration(milliseconds: 500), curve: Curves.easeIn);


                        },

                        decoration: InputDecoration(
                            hintText: 'send message',
                            suffixIcon: Icon(Icons.send),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(16)

                            )

                        ),


                      ),

                    )
                  ],
                )

            );
        }




  }





