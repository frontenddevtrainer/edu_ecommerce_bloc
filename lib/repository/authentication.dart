import 'package:dio/dio.dart';
import 'package:edu_ecommerce_bloc/models/user.dart';

class AuthenticationRepository {
  final dio = Dio();

  @override
  User? currentUser() {
    // throw UnimplementedError();
    return User(name: "praveen", id: "1");
  }

  @override
  Future<User> login(String email, String password) async {
    print(email);
    print(password);
    try {
      final response = await dio.post("http://example.com/login",
          data: {email: email, password: password});
      return User(name: response.data["name"], id: response.data["id"]);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<User> logout() {
    throw UnimplementedError();
  }
}
