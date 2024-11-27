import 'package:clean_artich/features/user/domain/entities/sub_entities/geo_entity.dart';
import 'package:clean_artich/features/user/domain/entities/user_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity({required this.street, required this.suite, required this.city, required this.zipcode, required this.geo});
}
