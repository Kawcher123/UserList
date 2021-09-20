import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_login/models/user_model.dart';

class UserProfileRepository {
  Future<UserModel> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String token = preferences.getString('TOKEN');

    UserModel jsonData;

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.Request(
          'GET', Uri.parse('http://202.53.174.5:4115/api/v1/user/profile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        jsonData = UserModel.fromJson(
            jsonDecode(await response.stream.bytesToString()));
        print(jsonData);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw (e).toString();
    }

    return jsonData;
  }
}
