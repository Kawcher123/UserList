import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future login(String email, String password) async {
    print(email);
    print(password);
    var jsonData;
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://202.53.174.5:4115/api/v1/auth/login'));
      request.body = '''{\n    "email":"$email",\n"password":"$password"\n}''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        jsonData = jsonDecode(await response.stream.bytesToString());
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
