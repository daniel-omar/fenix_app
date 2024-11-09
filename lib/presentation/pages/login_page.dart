import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fenix_app/presentation/blocs/login/login_cubit.dart';
import 'package:fenix_app/presentation/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Login"),
      // ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const _LoginView(),
      ),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterLogo(size: 100),
                SizedBox(height: 30),
                _LoginForm(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final username = loginCubit.state.username;
    final password = loginCubit.state.password;
    final isValid = loginCubit.state.isValid;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: loginCubit.usernameChanged,
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña:',
            obscureText: true,
            onChanged: loginCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 50),
          FilledButton.tonalIcon(
            onPressed: () {
              loginCubit.onSubmit();
              if (isValid) context.push('/home');
            },
            icon: const Icon(Icons.login),
            label: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
