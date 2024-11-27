import 'package:clean_artich/core/databases/api/end_points.dart';
import 'package:clean_artich/features/user/domain/entities/sub_entities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json[ApiKey.lat],
        lng: json[ApiKey.lng],
      );

  Map<String, dynamic> toJson() {
    return {
      ApiKey.lat: lat,
      ApiKey.lng: lng,
    };
  }
}
