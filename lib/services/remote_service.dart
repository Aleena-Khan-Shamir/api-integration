import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:practice2/models/user.dart';

class RemoterServices {
  static var client = http.Client();

  static Future<List<User>?> fetchUser() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      //log(jsonString);
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
