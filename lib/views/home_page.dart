
import 'package:e_commerce_app/views/cart_page.dart';
import 'package:e_commerce_app/views/product_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/controllers/user_cart.dart';
import '../models/product.dart';
import '../controllers/fetch_api.dart';

import 'favourite_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Product>> products;
  @override
  void initState() {
    super.initState();
    products = FetchApi.getListOfProducts();
  }
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
        Consumer<CartProvider>(
          builder: (context,userCart,child){
            return
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
                  },
                  icon:Stack(
                    children: [
                      Icon(Icons.shopping_cart_rounded, color: Colors.black),
                      Positioned(
                        right: 3,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text(
                            userCart.productInCart.length.toString(),
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                      ),
                    ],
                  )
              );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FavouritePage()));
            },
            icon: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              "Explore",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            Text(
              "Best Trendy collection!",
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: products,
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: SpinKitRing(color: Colors.white10),);
                  }else if(snapshot.hasError){
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }else if  (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Products found'));
                  }else {
                    return  GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 8.0, ),
                        padding: EdgeInsets.all(5),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductInfoPage(product: snapshot.data![index])));
                            },
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                children: [
                                  Image.network(snapshot.data![index].image,fit: BoxFit.fill,height: 100,width: 80,),
                                  Text(snapshot.data![index].category,textAlign: TextAlign.center,),
                                  Text("${snapshot.data![index].price}\$",textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            )],
        ),
      ),
    );
  }
}
