import 'package:clean_artich/core/errors/failure.dart';
import 'package:clean_artich/core/params/params.dart';
import 'package:clean_artich/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
