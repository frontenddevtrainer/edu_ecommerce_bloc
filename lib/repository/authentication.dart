import 'package:dio/dio.dart';
import 'package:edu_ecommerce_bloc/models/user.dart';
import 'package:flutter/foundation.dart';
import "dart:io" show Platform;

class AuthenticationRepository {

  static final String _baseUrl = kReleaseMode ? "https://edureka.co" : (Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000");

  static final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  User? currentUser() {
    // throw UnimplementedError();
    return User(name: "praveen", id: "1");
  }

  Future<User> login(String email, String password) async {
    print(email);
    print(password);
    try {
      final response = await dio.post("/login",
          data: {email: email, password: password});
      return User(name: response.data["name"], id: response.data["id"]);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<User> logout() {
    throw UnimplementedError();
  }

  Future<User> signup(String email, String password) async {
    print(email);
    print(password);
    try {
      final response = await dio.post("/signup",
          data: {"email": email, "password": password});
          print(response);
      return User(name: response.data["name"], id: response.data["id"]);
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
