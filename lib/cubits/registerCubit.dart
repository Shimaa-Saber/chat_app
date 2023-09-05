import 'package:chatapp/cubits/LoginStates.dart';
import 'package:chatapp/cubits/registerStates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class regCubit extends Cubit<regStates> {
  regCubit(super.initialState);


  Future<void> register({required String email,required String password})async{
    emit(regloading());

    try{
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
      emit(regsuccess());

    }
    catch(e){
      emit(regfailur());
    }

  }

}