import 'package:edu_ecommerce_bloc/cubits/authentication.dart';
import 'package:edu_ecommerce_bloc/cubits/theme.dart';
import 'package:edu_ecommerce_bloc/cubits/users.dart';
import 'package:edu_ecommerce_bloc/repository/authentication.dart';
import 'package:edu_ecommerce_bloc/widgets/authentication/LoginForm.dart';
import 'package:edu_ecommerce_bloc/widgets/authentication/RegisterForm.dart';
import 'package:edu_ecommerce_bloc/widgets/users/UserListing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final AuthenticationRepository authRepo  = AuthenticationRepository( secureStorage: secureStorage);

  runApp(Application( authRepo: authRepo, secureStorage: secureStorage ));
}

class Application extends StatelessWidget {

  final AuthenticationRepository authRepo;
  final FlutterSecureStorage secureStorage;

  const Application({super.key, required this.authRepo, required this.secureStorage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => UsersCubit(),
          ),
          BlocProvider(create: (context) => AuthenticationCubit(authenticationRepository: authRepo),)
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
      // body: const UserListing(),
      body: const RegisterForm(),
    );
  }
}
