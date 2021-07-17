import 'package:dartz/dartz.dart';
import 'package:ride_uber/core/error/failures.dart';
import 'package:meta/meta.dart';
import 'package:ride_uber/core/third_party_auth/domain/entities/third_party_user.dart';

abstract class ThirdPartyRepository {
  // Signs in with Firebase Email & Password
  Future<Either<Failure, ThirdPartyUser>> signInEmailPassword(
      {@required String email, @required String password});
}
