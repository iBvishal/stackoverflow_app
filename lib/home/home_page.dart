import 'package:flutter/material.dart';
import 'package:stackoverflow_app/home/index.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = new HomeBloc();
    return new HomeScreen(homeBloc: _homeBloc);
  }
}
