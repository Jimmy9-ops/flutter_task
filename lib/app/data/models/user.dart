import 'dart:convert';

class User {
  String phone;
  String password;
  int companyId;

  User({required this.phone, required this.password, required this.companyId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phone: json['phone'],
      password: json['password'],
      companyId: json['company_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['company_id'] = this.companyId;
    return data;
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  factory User.fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }
}