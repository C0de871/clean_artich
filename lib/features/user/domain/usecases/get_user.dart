import 'package:clean_artich/core/errors/failure.dart';
import 'package:clean_artich/core/params/params.dart';
import 'package:clean_artich/features/user/domain/entities/user_entity.dart';
import 'package:clean_artich/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }
}
