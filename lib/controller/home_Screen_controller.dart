import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_exam_task_sample/model/home_screen_model/home_screen_model.dart';

class HomeScreenController with ChangeNotifier {
  List<ListResProductAllMain> productlist = [];
  bool isloading = false;
  Future<void> getAllProductData() async {
    isloading = true;
    notifyListeners();
    // API call to get all product data
    final url = Uri.parse('https://api.restful-api.dev/objects');
    final responsdata = await http.get(url);
    if (responsdata.statusCode == 200) {
      productlist = listResProductAllMainFromJson(responsdata.body);
    }
    isloading = false;
    notifyListeners();
  }
}
