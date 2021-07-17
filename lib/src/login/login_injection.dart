import 'package:get_it/get_it.dart';
import 'package:ride_uber/src/login/data/database/login_remote_db.dart';
import 'package:ride_uber/src/login/data/repositories/login_repository_impl.dart';
import 'package:ride_uber/src/login/domain/repositories/login_repository.dart';
import 'package:ride_uber/src/login/domain/usecases/login.dart';
import 'package:ride_uber/src/login/presentation/bloc/login_bloc.dart';

void initLogin() {
  final sl = GetIt.instance;

  //Bloc
  sl.registerFactory(() => LoginBloc(login: sl()));

  //Usecase
  sl.registerLazySingleton(() => Login(sl()));

  //Repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDB: sl(), networkInfo: sl()));

  //Database
  sl.registerLazySingleton<LoginRemoteDB>(() => LoginRemoteDBImpl());
}
