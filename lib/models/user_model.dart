// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String user;
  final String password;
  final String type;
  final String avatar;
  UserModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.user,
    required this.password,
    required this.type,
    required this.avatar,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? user,
    String? password,
    String? type,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      user: user ?? this.user,
      password: password ?? this.password,
      type: type ?? this.type,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'user': user,
      'password': password,
      'type': type,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      user: map['user'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, address: $address, phone: $phone, user: $user, password: $password, type: $type, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.address == address &&
      other.phone == phone &&
      other.user == user &&
      other.password == password &&
      other.type == type &&
      other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      user.hashCode ^
      password.hashCode ^
      type.hashCode ^
      avatar.hashCode;
  }
}
