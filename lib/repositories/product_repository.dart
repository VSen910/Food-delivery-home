import 'package:campus_haat/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductRepository {
  static final _dio = Dio();

  static Future<List<Product>> fetchProducts(int page) async {
    try {
      const uri =
          'http://chprod-env.eba-psapqnmi.ap-south-1.elasticbeanstalk.com/webapi/products/productSearch';
      final body = {
        "creator": {
          "id": "6873",
          "creatorId": "298",
          "APIKey": dotenv.env['API_KEY'],
          "applicationId": "1",
          "createDate": "2024-09-15 13:15:45.8"
        },
        "campusId": "7740",
        "productCategory": {
          "selectedFilter": {"categoryId": "15"}
        },
        "productSection": "0",
        "loadType": 8,
        "limit": 10,
        "start": page,
      };

      final res = await _dio.post(uri, data: body);
      final resBody = res.data['productsList'][0]['products'];

      List<Product> products = [];
      for (var product in resBody) {
        products.add(Product.fromJson(product));
      }

      return products;
    } catch (e) {
      print('Error during POST: ${e.toString()}');
      return [];
    }
  }
}