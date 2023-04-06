import 'package:dio/dio.dart';
import 'package:edu_ecommerce_bloc/models/user.dart';
import 'package:flutter/foundation.dart';
import "dart:io" show Platform;
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class AuthenticationRepository {
  final FlutterSecureStorage secureStorage;

  static final String _baseUrl = kReleaseMode
      ? "https://edureka.co"
      : (Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000");

  static final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  AuthenticationRepository({required this.secureStorage});

  User? currentUser() {
    // throw UnimplementedError();
    return null;
  }

  Future<User> login(String email, String password) async {
    try {
      final response =
          await dio.post("/login", data: {email: email, password: password});
      return User(name: response.data["name"], id: response.data["id"]);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future<User> logout() {
    throw UnimplementedError();
  }

  Future<User> signup(String email, String password) async {
    try {
      final response = await dio
          .post("/signup", data: {"email": email, "password": password});
      await secureStorage.write(
          key: "auth_jwt", value: response.data["accessToken"]);
      return User(
          name: response.data["user"]["email"],
          id: response.data["user"]["id"]);
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
