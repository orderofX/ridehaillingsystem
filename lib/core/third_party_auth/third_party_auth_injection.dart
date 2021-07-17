import 'package:get_it/get_it.dart';
import 'package:ride_uber/core/third_party_auth/domain/usecases/sign_in_email_password.dart';

void initThirdPartyAuth() {
  final sl = GetIt.instance;

  // Bloc

  // Usecase
  sl.registerLazySingleton(() => SignInEmailPassword(sl()));

  // Repository

  // Database
}
