import 'package:e_commerce_app/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserFavourites with ChangeNotifier{
  List<Product> favouriteProducts = [];
  void AddToFavList(Product selectedProduct){
    favouriteProducts.add(selectedProduct);
    notifyListeners();
  }
  void RemoveToFavList(Product selectedProduct){
    favouriteProducts.remove(selectedProduct);
    notifyListeners();
  }

}