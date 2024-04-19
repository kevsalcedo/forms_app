import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New user"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        //key: _formKey,
        child: Column(
      children: [
        CustomTextFormField(
          label: "User name",
          errorMessage: username.errorMessage,
          onChanged: registerCubit.usernameChanged,
          /* (value) {
            registerCubit.usernameChanged(value);
            //_formKey.currentState?.validate();
          }, */
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: "Email",
          errorMessage: email.errorMessage,
          onChanged: registerCubit.emailChanged,
          /* (value) {
            registerCubit.emailChanged(value);
            //_formKey.currentState?.validate();
          }, */
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: "Password",
          errorMessage: password.errorMessage,
          onChanged: registerCubit.passwordChanged,
          /* (value) {
            registerCubit.passwordChanged(value);
            //_formKey.currentState?.validate();
          }, */
          obscureText: true,
        ),
        const SizedBox(height: 10),
        FilledButton.tonalIcon(
          onPressed: () {
            /* final isValid = _formKey.currentState!.validate();
                if (!isValid) return; */

            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text("Create user"),
        ),
        const SizedBox(height: 20),
      ],
    ));
  }
}
