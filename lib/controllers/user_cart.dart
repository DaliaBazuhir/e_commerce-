
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
class CartProvider with ChangeNotifier{
  Map<Product,int> productInCart = {};
  void addProductToCart(Product selectedProduct){
    if(!productInCart.containsKey(selectedProduct)){
      productInCart[selectedProduct] = 1;
    }else{
      productInCart[selectedProduct] = productInCart[selectedProduct]! + 1;
    }
    notifyListeners();
  }
  void removeProductFromCart(Product selectedProduct){
    if (productInCart.containsKey(selectedProduct) && productInCart[selectedProduct]! > 1) {
      productInCart[selectedProduct] = productInCart[selectedProduct]! - 1;
    } else {
      productInCart.remove(selectedProduct);
    }
    notifyListeners();
  }
  void deleteProductAtAll(Product selectedProduct){
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
