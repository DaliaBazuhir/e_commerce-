import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/userCart.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<cartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Cart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              provider.productInCart.length == 0
                  ? Center(child: Text("Cart is Empty.."))
                  : Expanded(
                child: Consumer<cartProvider>(
                  builder: (context, cartProvider, child) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: provider.productInCart.length,
                            itemBuilder: (context, index) {
                              final product =
                              cartProvider.productInCart.keys
                                  .toList()[index];
                              final quantity =
                              cartProvider.productInCart[product]!;
                              return Dismissible(
                                background: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20),
                                  alignment:
                                  AlignmentDirectional.centerStart,
                                  child: Icon(Icons.delete,
                                      color: Colors.white),
                                ),
                                key: Key(product.id.toString()),
                                onDismissed:
                                    (DismissDirection direction) {
                                  setState(() {
                                    provider.DeleteProductAtAll(product);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                    child: ListTile(
                                      leading: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: Image.network(product.image),
                                      ),
                                      title: Text(product.category),
                                      subtitle: Flexible(
                                        child: Row(
                                          children: [
                                            Text(
                                                "${product.price * quantity} \$"),
                                            Flexible(child:  SizedBox(
                                              width: MediaQuery.sizeOf(
                                                  context)
                                                  .width /
                                                  4 -
                                                  10,
                                            ),),
                                            IconButton(
                                              onPressed: () {
                                                provider.addProductToCart(
                                                    product);
                                              },
                                              icon: Icon(
                                                Icons.add_circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Text("$quantity"),
                                            IconButton(
                                              onPressed: () {
                                                provider
                                                    .RemoveProductFromCart(
                                                    product);
                                              },
                                              icon: Icon(
                                                Icons.remove_circle,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text("Total:"),
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width /
                                    5),
                            Text("${provider.getTotalPrice()}")
                          ],
                        ),

                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
