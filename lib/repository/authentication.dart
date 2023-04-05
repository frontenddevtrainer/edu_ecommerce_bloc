import 'package:edu_ecommerce_bloc/models/user.dart';

class AuthenticationRepository {
  @override
  User? currentUser() {
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<User> logout() {
    throw UnimplementedError();
  }
}
