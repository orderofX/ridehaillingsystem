import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_uber/core/error/failures.dart';
import 'package:ride_uber/core/usecases/usecase.dart';
import 'package:meta/meta.dart';
import 'package:ride_uber/core/user/domain/entities/user.dart';
import 'package:ride_uber/src/login/domain/repositories/login_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final LoginRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(
        email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
