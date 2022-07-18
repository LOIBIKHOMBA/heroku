import 'dart:developer';

import 'package:fetchdata/model/albums.dart';
import 'package:fetchdata/service/service.api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListUPdate(),
    );
  }
}

class ListUPdate extends StatefulWidget {
  const ListUPdate({Key? key}) : super(key: key);

  @override
  State<ListUPdate> createState() => _ListUPdateState();
}

class _ListUPdateState extends State<ListUPdate> {
  List<Datum> d = [];
  List data = ["santa", "lobii", "m"];
  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    log('ok');
    super.initState();
    getdata();
  }

  getdata() async {
    var data = await ServiceApi().fetchAlbum();

    setState(() {
      d = data.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('yade');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Data From Backend"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: d.length,
        itemBuilder: (c, i) {
          log('yaroidro');
          return Text(d[i].attributes.albumName);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) {
                  return AlertDialog(
                    title: const Text("Add new data"),
                    content: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'enter any data',
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Post"))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)),
    );
  }
}

// class Fetchdatafromserver extends StatefulWidget {
//   const Fetchdatafromserver({Key? key}) : super(key: key);

//   @override
//   State<Fetchdatafromserver> createState() => _FetchdatafromserverState();
// }

// class _FetchdatafromserverState extends State<Fetchdatafromserver> {
//   List<UserModel> user = [];
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   getdata() async {
//     var _user = await ServiceApi().getdata();
//     setState(() {
//       user = _user;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("user mayam mayam"),
//       ),
//       body: ListView.builder(
//           itemCount: user.length,
//           itemBuilder: (c, i) {
//             return Text(user[i].name);
//           }),
//     );
//   }
// }
