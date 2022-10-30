import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mentomind/common/constant.dart';
import 'package:mentomind/model/category.dart';

class CategoryRepo {
  ApiConstants constants = ApiConstants();
  Future<List<Category>> getCategories() async {
    Map<String, String>? headers = {
      constants.userId: constants.userIdValue,
      constants.token: constants.tokenValue
    };
    try {
      http.Response response =
          await http.get(Uri.parse(constants.getUrl), headers: headers);
      var list = jsonDecode(response.body);
      List<Category> categoryList = [];
      list.forEach((e) {
        Category a = Category.fromJson(e);
        categoryList.add(a);
      });
      return categoryList;
    } catch (err) {
      print(err);
      return [];
    }
  }
}
