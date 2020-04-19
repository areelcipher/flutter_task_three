import 'package:flutter/material.dart';
import 'package:fluttertaskthree/http_service.dart';
import 'package:fluttertaskthree/post_detail.dart';
import 'package:fluttertaskthree/post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      centerTitle: true,
        title: Text(
            'List of users',
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
        child: FutureBuilder(
          future: httpService.getposts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if(snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView(
                children: posts.map((Post post) => ListTile(
                  title: Container(
                    color: Colors.grey[900],
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.grey[850],
                          radius: 30.0,
                          child: Icon(
                            Icons.account_circle,
                            size: 57.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    post.name,
                                  style: TextStyle(color: Colors.white, fontSize: 24.0, letterSpacing: 2.0),
                                ),
                                SizedBox(height: 5.0,),
                                Text(
                                    post.email,
                                  style: TextStyle(color: Colors.grey, fontSize: 16.0, letterSpacing: 1.0),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostDetail(post: post,))
                  ),
                )).toList(),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(width: 10.0,),
                Text(
                    'Loading...',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[300]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
