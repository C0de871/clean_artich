import 'package:clean_artich/core/connection/network_info.dart';
import 'package:clean_artich/core/databases/api/api_consumer.dart';
import 'package:clean_artich/core/databases/api/dio_consumer.dart';
import 'package:clean_artich/core/databases/cache/cache_helper.dart';
import 'package:clean_artich/features/user/data/data_sources/user_local_data_source.dart';
import 'package:clean_artich/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:clean_artich/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_artich/features/user/domain/repositories/user_repository.dart';
import 'package:clean_artich/features/user/domain/usecases/get_user.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Data Sources
  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(api: getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource(cache: getIt()));

  // Repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        localDataSource: getIt(),
      ));

  // Use Cases
  getIt.registerLazySingleton<GetUser>(() => GetUser(repository: getIt()));
}
