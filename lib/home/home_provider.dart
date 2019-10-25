import 'package:stackoverflow_app/home/index.dart';

class HomeProvider {
  final HomeRepository _homeRepository = new HomeRepository();

  HomeProvider();

  void test() {
    this._homeRepository.test();
  }
}
// this is just for hacktoberfest
// adding another line won't change nothing
