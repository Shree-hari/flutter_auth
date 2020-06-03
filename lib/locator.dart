import 'package:get_it/get_it.dart';
import 'package:flutterapps/services/navigation_service.dart';
import 'package:flutterapps/services/dialog_service.dart';
import 'services/authentication_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}
