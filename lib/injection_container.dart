import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:ride_uber/core/platform/network_info.dart';
import 'package:ride_uber/core/third_party_auth/third_party_auth_injection.dart';
import 'package:ride_uber/core/user/user_dependecy_injection.dart';
import 'package:ride_uber/src/login/login_injection.dart';

final sl = GetIt.instance;

void init() {
  initCore();
  initFeatures();
  initExternal();
}

void initCore() {
  initUser();
  // Third Party Authentication
  initThirdPartyAuth();
  //Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

void initFeatures() {
  // Login Feature Dependencies
  initLogin();
}

void initExternal() {
  sl.registerFactory(() => FirebaseAuth);
}
