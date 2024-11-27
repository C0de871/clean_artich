import 'package:clean_artich/core/databases/api/end_points.dart';
import 'package:clean_artich/features/user/data/models/sub_model/address_model.dart';
import 'package:clean_artich/features/user/data/models/sub_model/company_model.dart';
import 'package:clean_artich/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      phone: json[ApiKey.phone],
      email: json[ApiKey.email],
      address: AddressModel.fromJson(json[ApiKey.address]),
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.email: email,
      ApiKey.address: (address as AddressModel).toJson(),
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.company: company.tojson(),
    };
  }
}
