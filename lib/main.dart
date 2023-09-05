import 'package:chatapp/cubits/LoginStates.dart';
import 'package:chatapp/cubits/chat_cubit.dart';
import 'package:chatapp/cubits/chat_states.dart';
import 'package:chatapp/cubits/loginCubits.dart';
import 'package:chatapp/cubits/registerStates.dart';
import 'package:chatapp/screens/SignUp.dart';
import 'package:chatapp/screens/chatpage.dart';
import 'package:chatapp/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/registerCubit.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( chatapp());
}

class chatapp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => regCubit(regInitial())),
    BlocProvider(create:(context) => LoginCubit(loginInitial())),
        BlocProvider(create: (context)=>chatCubit(chatInitial()))



      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3:false ),
        routes: {
          Login.id: (context) => Login(),
          SineUP.id:(context)=>SineUP(),
          chat.id : (context) => chat()
        },
        initialRoute: Login.id,
      ),
    );
  }
}