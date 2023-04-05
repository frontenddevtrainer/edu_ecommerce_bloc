import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersDataState> {
  UsersCubit() : super(UsersDataIntial());

  final dio = Dio();

  Future<void> fetchUsers() async {
    emit(UsersDataLoading());
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/users");

    if (response.statusCode == 200) {
      emit(UsersDataLoaded(response.data));
    } else {
      emit(UsersDataError("Error fetching data from api."));
    }
  }
}

abstract class UsersDataState {}

class UsersDataIntial extends UsersDataState {}

class UsersDataLoading extends UsersDataState {}

class UsersDataLoaded extends UsersDataState {
  final List<dynamic> users;
  UsersDataLoaded(this.users);
}

class UsersDataError extends UsersDataState {
  final String message;
  UsersDataError(this.message);
}
