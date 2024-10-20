
import 'package:e_commerce_app/models/Product.dart';
import 'package:flutter/material.dart';
class cartProvider with ChangeNotifier{
  Map<Product,int> productInCart = {};
  void addProductToCart(Product selectedProduct){
    if(!productInCart.containsKey(selectedProduct)){
      productInCart[selectedProduct] = 1;
    }else{
      productInCart[selectedProduct] = productInCart[selectedProduct]! + 1;
    }
    notifyListeners();
  }
  void RemoveProductFromCart(Product selectedProduct){
    if (productInCart.containsKey(selectedProduct) && productInCart[selectedProduct]! > 1) {
      productInCart[selectedProduct] = productInCart[selectedProduct]! - 1;
    } else {
      productInCart.remove(selectedProduct);
    }
    notifyListeners();
  }
  void DeleteProductAtAll(Product selectedProduct){
    productInCart.remove(selectedProduct);
    notifyListeners();
  }
  double getTotalPrice(){
    double total = 0;
    productInCart.forEach((product,quantity){
      total += product.price * quantity.toDouble();
    });
    return total.toDouble();
  }

}
