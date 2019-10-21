import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';

import 'core/services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() =>AuthenticationService());
}