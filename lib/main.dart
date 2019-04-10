import 'package:fl_uberapp/src/app.dart';
import 'package:fl_uberapp/src/resources/home_page.dart';
import 'package:fl_uberapp/src/resources/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fl_uberapp/src/blocs/auth_bloc.dart';

void main() {
  runApp(MyApp(
      new AuthBloc(),
      MaterialApp(
        home: HomePage(),
      )));
}
