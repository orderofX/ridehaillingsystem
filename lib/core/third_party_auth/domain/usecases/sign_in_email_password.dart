import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ride_uber/core/error/failures.dart';
import 'package:ride_uber/core/third_party_auth/domain/entities/third_party_user.dart';
import 'package:ride_uber/core/third_party_auth/domain/repositories/third_party_repository.dart';
import 'package:ride_uber/core/usecases/usecase.dart';

class SignInEmailPassword
    implements UseCase<ThirdPartyUser, SignInEmailPasswordParams> {
  final ThirdPartyRepository repository;

  SignInEmailPassword(this.repository);

  @override
  Future<Either<Failure, ThirdPartyUser>> call(
      SignInEmailPasswordParams params) async {
    return await repository.signInEmailPassword(
        email: params.email, password: params.password);
  }
}

class SignInEmailPasswordParams extends Equatable {
  final String email;
  final String password;

  SignInEmailPasswordParams({@required this.email, this.password});
  @override
  List<Object> get props => [email, password];
}
