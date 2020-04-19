import 'dart:convert';

import 'package:fluttertaskthree/post_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String postUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Post>>getposts() async {
    Response res = await get(postUrl);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
        body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw 'Cannot get posts';
    }
  }
}