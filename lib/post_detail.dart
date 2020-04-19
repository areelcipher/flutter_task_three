import 'package:flutter/material.dart';
import 'package:fluttertaskthree/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          post.name,
          style: TextStyle(
            letterSpacing: 6.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        color: Colors.grey[850],
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.grey[900],
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                        'Username',
                      style: TextStyle(fontSize: 22.0, color: Colors.white, letterSpacing: 2.0),
                    ),
                    subtitle: Text(
                        post.username,
                      style: TextStyle(color: Colors.grey, fontSize: 16.0, letterSpacing: 3.0),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(fontSize: 22.0, color: Colors.white, letterSpacing: 2.0),
                    ),
                    subtitle: Text(
                      post.email,
                      style: TextStyle(color: Colors.grey, fontSize: 16.0, letterSpacing: 3.0),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 22.0, color: Colors.white, letterSpacing: 2.0),
                    ),
                    subtitle: Text(
                      post.phone,
                      style: TextStyle(color: Colors.grey, fontSize: 16.0, letterSpacing: 3.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
