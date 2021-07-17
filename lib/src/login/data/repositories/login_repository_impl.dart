import 'package:ride_uber/core/error/exception.dart';
import 'package:ride_uber/core/platform/network_info.dart';
import 'package:ride_uber/core/user/domain/entities/user.dart';
import 'package:ride_uber/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:ride_uber/src/login/data/database/login_remote_db.dart';
import 'package:ride_uber/src/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDB remoteDB;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({@required this.remoteDB, @required this.networkInfo});

  @override
  Future<Either<Failure, User>> login({String email, String password}) async {
    // TODO: implement login
    if (await networkInfo.isConnected) {
      try {
        final remoteUser =
            await remoteDB.loginUser(email: email, password: password);
        print('REMOTE USERRR: $remoteUser');
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
