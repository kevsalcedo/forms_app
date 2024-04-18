import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New user"),
      ),
      body: const _RegisterView(),
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: "User name",
              onChanged: (value) => username = value,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: "Email",
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: "Password",
              onChanged: (value) => password = value,
              obscureText: true,
            ),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text("Create user"),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
