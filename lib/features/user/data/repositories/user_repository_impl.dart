import 'package:clean_artich/core/connection/network_info.dart';
import 'package:clean_artich/core/errors/expentions.dart';
import 'package:clean_artich/core/errors/failure.dart';
import 'package:clean_artich/core/params/params.dart';
import 'package:clean_artich/features/user/data/data_sources/user_local_data_source.dart';
import 'package:clean_artich/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:clean_artich/features/user/domain/entities/user_entity.dart';
import 'package:clean_artich/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.networkInfo, required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser({required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSource.getUser(params);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await localDataSource.getLastUser();
        print("---------------$localUser");
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
