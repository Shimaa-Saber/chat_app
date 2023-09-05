import 'package:chatapp/componants/custom_button.dart';
import 'package:chatapp/cubits/registerCubit.dart';
import 'package:chatapp/cubits/registerStates.dart';
import 'package:chatapp/screens/chatpage.dart';
import 'package:chatapp/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../componants/text_filed.dart';
import '../constants/constant.dart';

class SineUP extends StatelessWidget {
  SineUP({Key? key}) : super(key: key);
  static String id = 'RegisterPage';





  String? email;

  String ?password;

GlobalKey<FormState> formkey=GlobalKey();

bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<regCubit,regStates> (
      listener: (context, state) {
        if(state is regloading){
          isLoading=true;
        }
        else if(state is regsuccess){
          Navigator.pushNamed(context, chat.id);
        }
        else if(state is regfailur)
        {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('something went wrong')));

        }
      },

    builder: (context, state) =>   ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key:formkey ,
              child: ListView(

                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image(image:AssetImage('assets/images/scholar.png') ,height: 100    ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Scholar Chat',style: TextStyle(color: Colors.green,fontSize: 30,fontFamily: 'Pacifico'),),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign UP',style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w900),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextF(
                      onchanged: (data){
                        email=data;
                      },

                      hint: 'Enter email', icon: Icons.email),
                  SizedBox(height: 15,),
                  TextF(
                    obscure: true,
                      onchanged: (data){
                        password=data;
                      },
                      hint: 'Enter password', icon: Icons.lock),
                  SizedBox(height: 15,),

               button(color: Colors.white, button_text: 'Regester',
        onTap: () async {
                 if(formkey.currentState!.validate()) {
                 BlocProvider.of<regCubit>(context).register(email: email!, password: password!);
                 }
        }),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('alruedy have an account ?  ',style: TextStyle(color: Colors.white),),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Login();
                            },));
                          },
                          child:
                          Text('Login ',style: TextStyle(color: Colors.white),)),
                    ],
                  ),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
