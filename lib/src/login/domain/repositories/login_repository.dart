import 'package:dartz/dartz.dart';
import 'package:ride_uber/core/error/failures.dart';
import 'package:ride_uber/core/user/domain/entities/user.dart';
import 'package:meta/meta.dart';

abstract class LoginRepository {
  /// Log in [User]
  Future<Either<Failure, User>> login(
      {@required String email, @required String password});
}
