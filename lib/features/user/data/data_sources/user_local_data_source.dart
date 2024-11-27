import 'dart:convert';

import 'package:clean_artich/core/databases/api/end_points.dart';
import 'package:clean_artich/core/databases/cache/cache_helper.dart';
import 'package:clean_artich/core/databases/cache/cache_keys.dart';
import 'package:clean_artich/core/errors/expentions.dart';
import 'package:clean_artich/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cache;

  UserLocalDataSource({required this.cache});

  cacheUser(UserModel? userToCache) {
    if (userToCache != null) {

      cache.saveData(
        key: CacheKeys.userKey,
        value: json.encode(
          userToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: CacheKeys.userKey);
    
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
