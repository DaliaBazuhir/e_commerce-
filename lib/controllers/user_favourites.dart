import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserFavourites with ChangeNotifier{
  List<Product> favouriteProducts = [];
  void addToFavList(Product selectedProduct){
    favouriteProducts.add(selectedProduct);
    notifyListeners();
  }
  void removeToFavList(Product selectedProduct){
    favouriteProducts.remove(selectedProduct);
    notifyListeners();
  }

}