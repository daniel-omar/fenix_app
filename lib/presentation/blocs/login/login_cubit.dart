import 'package:fenix_app/infrestructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit() {
    print('Cubit Submit: $state');

    emit(state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        isValid: Formz.validate([
          state.username,
          state.password,
          // TODO: state.email
        ])));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username])));
  }
}
