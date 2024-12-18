import 'package:clean_artich/core/databases/api/api_consumer.dart';
import 'package:clean_artich/core/databases/api/end_points.dart';
import 'package:clean_artich/core/params/params.dart';
import 'package:clean_artich/features/user/data/models/user_model.dart';
import 'package:clean_artich/features/user/domain/usecases/get_user.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});
  Future<UserModel> getUser(UserParams params) async {
    final response = await api.get("${EndPoints.user}/${params.id}");

    return UserModel.fromJson(response);
  }
}
