import 'package:chatapp/componants/custom_button.dart';
import 'package:chatapp/cubits/LoginStates.dart';
import 'package:chatapp/cubits/chat_cubit.dart';
import 'package:chatapp/cubits/loginCubits.dart';
import 'package:chatapp/screens/chatpage.dart';
import 'package:chatapp/screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../componants/text_filed.dart';
import '../constants/constant.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  static String id = 'login page';
  String ?email;

  String ?password;




  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is loginloading){
          isLoading=true;
        }
        else if(state is loginsuccess){
          BlocProvider.of<chatCubit>(context).getmessage();
          Navigator.pushNamed(context, chat.id);
        }
        else if(state is loginfailur)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('something went wrong')));

          }

      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(

                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image(
                    image: AssetImage('assets/images/scholar.png'), height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Scholar Chat', style: TextStyle(color: Colors.green,
                          fontSize: 30,
                          fontFamily: 'Pacifico'),),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login', style: TextStyle(color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextF(
                      onchanged: (data) {
                        email = data;
                      },
                      hint: 'Enter email', icon: Icons.email),
                  SizedBox(height: 15,),
                  TextF(
                      obscure: true,
                      onchanged: (data) {
                        password = data;
                      },

                      hint: 'Enter password', icon: Icons.lock),
                  SizedBox(height: 20,),

                  button(
                      color: Colors.white, button_text: 'Login',

                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                         BlocProvider.of<LoginCubit>(context).Login(email: email!, password: password!);
                        }
                      }


                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('don\'t have an account ?  ',
                        style: TextStyle(color: Colors.white),),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) {
                              return SineUP();
                            },));
                          },
                          child:
                          Text('Register now  ',
                            style: TextStyle(color: Colors.white),)),
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
  Future<void> LoginFun() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}


