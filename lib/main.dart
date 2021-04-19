import 'package:api_demo_flutter/post_result_model.dart';
import 'package:api_demo_flutter/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter API"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((user != null)
                  ? user.id + " | " + user.name //+
                  // " | " +
                  // user.job +
                  // " | " +
                  // user.created
                  : "Tidak Ada Data"),
              ElevatedButton(
                onPressed: () {
                  User.connectToAPI("3").then((value) {
                    user = value;
                    setState(() {});
                  });
                  // PostResult.connectToAPI("Refsi", "Programmer").then((value) {
                  //   postResult = value;
                  //   setState(() {});
                  // }); // onPressed yang digunakan untuk method Post
                },
                // child: Text("POST"), // tombol method POST
                child: Text("GET"), // tombol method GET
              )
            ],
          ),
        ),
      ),
    );
  }
}
