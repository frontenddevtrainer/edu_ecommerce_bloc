import 'package:edu_ecommerce_bloc/cubits/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              theme: state,
              home: const HomeScreen(),
            );
          },
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.abc),
        onPressed: () {
          context.read<ThemeCubit>().toggleTheme();
        },
      ),
    );
  }
}
