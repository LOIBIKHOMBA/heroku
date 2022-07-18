import 'dart:convert';
import 'dart:developer';

import 'package:fetchdata/main.dart';
import 'package:fetchdata/model/albums.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<void> getdata() async {
    var response = await http.get(
      Uri.parse(
        "https://plantcount.herokuapp.com/api/albums",
      ),
    );

    // log(response.body.toString());
    try {
      var decode = jsonDecode(response.body);
      var data = AlbumsModel.fromJson(jsonDecode(decode));
      log(data.data.length.toString());
    } catch (e) {
      log(e.toString());
    }
    // final data = AlbumsModel.fromJson(jsonDecode(response.body));
    // log(data.toJson().toString());
    // return data;

    // return data;
    // var users = data.map((e) => UserModel.fromJson(e)).toList();
    // return users;
  }

  Future<AlbumsModel> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://plantcount.herokuapp.com/api/albums'));

    if (response.statusCode == 200) {
      var getdata = AlbumsModel.fromJson(jsonDecode(response.body));

      log(getdata.data[0].attributes.albumName.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return getdata;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
