import 'dart:async';
import 'package:stackoverflow_app/home/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent {
  Future<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc});
  final HomeProvider _homeProvider = new HomeProvider();
}

class LoadHomeEvent extends HomeEvent {
  @override
  String toString() => 'LoadHomeEvent';

  @override
  Future<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      this._homeProvider.test();
      return new InHomeState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorHomeState(_?.toString());
    }
  }
}
