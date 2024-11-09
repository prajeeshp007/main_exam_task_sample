import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_exam_task_sample/model/product_details_Screen_model/product_details_screen_model.dart';

class ProductsDetailsScreenController with ChangeNotifier {
  SingleResProductAllMain? singleproduct;
  bool isloading = false;
  Future<void> getSingleproduct({required String product_id}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse('https://api.restful-api.dev/objects/$product_id');

    final Responsedata = await http.get(url);
    if (Responsedata.statusCode == 200) {
      singleproduct = singleResProductAllMainFromJson(Responsedata.body);
    }
    isloading = false;
    notifyListeners();
  }
}
