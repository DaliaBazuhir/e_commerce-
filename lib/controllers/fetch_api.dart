import 'dart:convert';

import 'package:e_commerce_app/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/models/product.dart';


class FetchApi {
  final String apiUrl = "$kurl$kproduct";
  static Future<Product?> getProductByCategory(String specificCategory)async{
    try{
      final response = await http.get(Uri.parse("$kurl$kproduct$kcategory/$specificCategory"));
      if(response.statusCode == 200){
        String data = response.body;

        return  Product.fromJson(jsonDecode(data));
      }else{
        throw Exception("Status Code ${response.statusCode}");
      }
    }catch(e){
      print(e);
      return null;
    }
  }
  static Future<List<Product>> getListOfProducts() async{
    try{
      final reponse = await http.get(Uri.parse("$kurl$kproduct"));
      if(reponse.statusCode == 200){
        List<dynamic> data = jsonDecode(reponse.body);
        List<Product> products = data.map((dynamic x)=> Product.fromJson(x)).toList();
        return products;
      }else{
        throw Exception("Response Status code ${reponse.statusCode}");
      }
    }catch(ex){
      print(ex);
      return [];
    }
  }
}
