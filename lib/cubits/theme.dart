import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(light);

  // States
  static final light = ThemeData(primarySwatch: Colors.amber);

  static final dark = ThemeData(primarySwatch: Colors.brown);

  void toggleTheme() {
    emit(state == light ? dark : light);
  }
}
