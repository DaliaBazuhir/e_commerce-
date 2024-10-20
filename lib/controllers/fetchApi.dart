import 'dart:convert';

import 'package:e_commerce_app/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce_app/models/Product.dart';

// class FetchApi{
//   static Future getProduct() async{
//     try{
//       http.Response response = await http.get(Uri.parse("$url$product/1"));
//       if(response.statusCode == 200){
//         String data = response.body;
//         // print(data);
//
//         var decodedData = jsonDecode(data);
//         return Product.fromJson(decodedData);
//       }else{
//         print("$response.statusCode");
//       }
//     }catch(ex){
//       print(ex);
//     }
//   }
//   static Future getListOfProducts() async{
//     try{
//       http.Response response = await http.get(Uri.parse("$url$product"));
//       if(response.statusCode == 200){
//         List<dynamic> jsonData  = jsonDecode(response.body);
//        // Product.fromJson(decodedData);
//         List products = jsonData.map((data)=> Product.fromJson(data)).toList();
//         return jsonData.map((data)=> Product.fromJson(data)).toList();
//       }else{
//         print("$response.statusCode");
//       }
//     }catch(ex){
//       print(ex);
//     }
//   }
//   Future<List<Product>> getAllProducts() async{
//     List<Product> products = [];
//    try{
//      final response = await http.get(Uri.parse("$url$product"));
//
//      if(response.statusCode == 200){
//        List<dynamic> body = jsonDecode(response.body);
//        products = body.map((dynamic x)=>Product.fromJson(x)).toList();
//        return products;
//      }else{
//        print("Status code of response = ${response.statusCode}");
//      }
//    }catch(ex){
//      print(ex);
//
//    }
//    return [];
//   }
// }



class FetchApi {
  final String apiUrl = "$url$product";
  static Future<Product?> getProductByCategory(String specificCategory)async{
    try{
      final response = await http.get(Uri.parse("$url$product$category/$specificCategory"));
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
      final reponse = await http.get(Uri.parse("$url$product"));
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
