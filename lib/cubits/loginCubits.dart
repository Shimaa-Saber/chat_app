import 'package:chatapp/cubits/LoginStates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(super.initialState);



  Future<void> Login({required String email,required String password}) async {
    emit(loginloading());

    try{
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email, password: password);
      emit(loginsuccess());
    }catch(e){
      emit(loginfailur());
    }

  }
  @override
  void onChange(Change<LoginStates> change) {
    // TODO: implement onChange
    super.onChange(change);
    print (change);
  }
}

