part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class LoginFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Password password;

  const LoginFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Password? password,
  }) =>
      LoginFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, isValid, username, password];
}
