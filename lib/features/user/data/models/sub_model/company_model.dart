import 'dart:core';

import 'package:clean_artich/core/databases/api/end_points.dart';

class CompanyModel {
  final String name, catchPhrase, bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json[ApiKey.name],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.name: name,
      ApiKey.catchPhrase: catchPhrase,
      ApiKey.bs: bs,
    };
  }
}
