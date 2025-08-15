import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_model.dart';

class ApiFetcher {
  final String baseUrl;

  ApiFetcher({this.baseUrl = 'https://fakestoreapi.com'});

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}