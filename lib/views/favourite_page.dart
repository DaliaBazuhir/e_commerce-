import 'package:e_commerce_app/controllers/userFavourites.dart';
import 'package:e_commerce_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Products"),
        backgroundColor: Colors.blue.withOpacity(0.5),
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<UserFavourites>(
                    builder: (context,UserFavourites,child){
                      return Expanded(
                        child: ListView.builder(
                            itemCount: UserFavourites.favouriteProducts.length,
                            itemBuilder: (context,index){
                              Product product = UserFavourites.favouriteProducts[index];
                              bool isFav = true;
                              return UserFavourites.favouriteProducts.length == 0 ?
                              Center(child: Text("Favourite list is empty"),) :
                              Dismissible(
                                  background: Container(
                                    color: Colors.red,
                                    child: Icon(Icons.delete,color: Colors.grey,),
                                  ),
                                  key: Key(product.id.toString()),
                                  onDismissed:   (DismissDirection direction) {
                                    setState(() {
                                      UserFavourites.RemoveToFavList(product);
                                    });
                                  },
                                  child: Card(
                                    child: ListTile(
                                      leading: Container(
                                        child: Image.network(product.image),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                      ),
                                      title: Text(product.category),
                                      trailing: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              isFav = false;
                                              if(!isFav){
                                                UserFavourites.RemoveToFavList(product);
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.favorite, color: isFav ? Colors.red : Colors.grey,)),
                                    ),
                                  ));
                            }),
                      );
                    })
              ],
            ),
          )
      ),
    );
  }
}
