import 'package:flutter/cupertino.dart';

class Post {
  final String name;
  final String username;
  final String email;
  final String phone;

  Post({
    @required this.name,
    @required this.username,
    @required this.email,
    @required this.phone
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
    );
  }

}