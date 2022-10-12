import 'package:drak_light/core/view_model/screens/screen_one_view_model.dart';
import 'package:drak_light/core/view_model/screens/screen_second_view_model.dart';
import 'package:drak_light/core/view_model/screens/screen_three_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setLocator() {
  locator.registerLazySingleton(() => ScreenOneViewModel());
  locator.registerLazySingleton(() => ScreenSecondViewModel());
  locator.registerLazySingleton(() => ScreenThreeViewModel());
}
