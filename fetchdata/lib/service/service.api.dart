import 'dart:convert';

import 'package:fetchdata/model/albums.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<Albums> getdata() async {
    var response = await http.get(
      Uri.parse(
        "https://plantcount.herokuapp.com/api/albums",
      ),
    );
    final data = Albums.fromJson(jsonDecode(response.body));

    return data;
    // var users = data.map((e) => UserModel.fromJson(e)).toList();
    // return users;
  }
}
