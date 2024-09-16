import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/model/product_model.dart';

class ApiService {
  static const String apiUrl = 'https://dummyjson.com/products';

  // Fetch the complete ProductModel including products, total, skip, and limit
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the JSON response and map it to the ProductModel
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return ProductModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
