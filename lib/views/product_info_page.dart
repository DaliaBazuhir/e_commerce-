import 'package:e_commerce_app/controllers/user_cart.dart';
import 'package:e_commerce_app/controllers/user_favourites.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductInfoPage extends StatefulWidget {
  Product product;
  ProductInfoPage({required this.product});
  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  var isFavourited = false;
  var buyNow = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userFavouriteProvider = Provider.of<UserFavourites>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"), backgroundColor: Colors.blue.withOpacity(0.5),),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height/3,
                    width: MediaQuery.sizeOf(context).width-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(widget.product.image,fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 15,),
                  Text(widget.product.title,style: TextStyle(fontWeight: FontWeight.w400,),),
                  SizedBox(height: 15,),
                  Text("Description"),
                  SizedBox(height: 5,),
                  Text(widget.product.description,style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Text("${widget.product.price} \$",style: TextStyle(color: Colors.red),),
                      SizedBox(width: 10,),

                      IconButton(
                          icon: Icon(Icons.favorite,color: isFavourited ? Colors.red : Colors.grey,),
                          onPressed: () {
                            setState(() {
                              isFavourited = !isFavourited;
                              isFavourited ? userFavouriteProvider.addToFavList(widget.product) :
                              userFavouriteProvider.removeToFavList(widget.product);
                            });
                          }
                      ),
                      SizedBox(width: 10,),
                      Expanded(child:  OutlinedButton(
                        onPressed: (){
                          setState(() {
                            cartProvider.addProductToCart(widget.product);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                        ),
                        child: Text("Buy Now",style: TextStyle(color: Colors.red),),

                      ),)
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
