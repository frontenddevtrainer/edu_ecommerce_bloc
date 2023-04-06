import 'package:edu_ecommerce_bloc/cubits/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _handleLogin(BuildContext context){
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    context.read<AuthenticationCubit>().login(email, password);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Password"),
          ),
          ElevatedButton(onPressed: (){ _handleLogin(context); }, child: const Text("Login"))
        ],
      )),
    );
  }
}
