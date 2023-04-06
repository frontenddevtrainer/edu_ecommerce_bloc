import 'package:edu_ecommerce_bloc/models/user.dart';
import 'package:edu_ecommerce_bloc/repository/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationCubit({required this.authenticationRepository})
      : super(AuthenticationStateIntial()) {
    checkUserStatus();
  }

  void checkUserStatus() {
    final user = authenticationRepository.currentUser();
    if (user == null) {
      emit(AuthenticationNotComplete());
    } else {
      emit(AuthenticationStateLoaded(user: user));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final dynamic user =
          await authenticationRepository.login(email, password);
      emit(AuthenticationStateLoaded(user: user));
    } catch (e) {
      emit(AuthenticationStateError());
    }
  }

  Future<void> logout(String email, String password) async {
    try {
      await authenticationRepository.logout();
      emit(AuthenticationNotComplete());
    } catch (e) {
      emit(AuthenticationStateError());
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      final user = await authenticationRepository.signup(email, password);
      print(user.id);
      emit(AuthenticationStateLoaded(user: user));
    } catch (e) {
      emit(AuthenticationStateError());
    }
  }
}

abstract class AuthenticationState {}

class AuthenticationStateIntial extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateLoaded extends AuthenticationState {
  final User user;

  AuthenticationStateLoaded({required this.user});
}

class AuthenticationStateError extends AuthenticationState {}

class AuthenticationNotComplete extends AuthenticationState {}
