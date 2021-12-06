import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trips_app/modal/data_modal.dart';

class DataServices {
  String baseUrl = "http://bslmeiyu.com/api";
  Future<List<DataModal>> getPlaces() async {
    var apiUrl = "/getplaces";
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((data) => DataModal.fromJson(data)).toList();
      } else {
        return <DataModal>[];
      }
    } catch (e) {
      print(e);

      return <DataModal>[];
    }
  }
}
