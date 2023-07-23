import 'package:flutter/material.dart';
import 'package:hermanos/models/menu_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<MenuModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: 'Burrito',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            if (value.cartItems.length != 0)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 64,
                          width: 64,
                        ),
                        title: Text(
                          value.cartItems[index][0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('\$${value.cartItems[index][1]}'),
                        trailing: IconButton(
                          onPressed: () {
                            Provider.of<MenuModel>(context, listen: false)
                                .removeItemFromCart(index);
                          },
                          icon: const Icon(
                            Icons.cancel,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: value.cartItems.length,
                ),
              )
            else
              Expanded(
                child: Column(
                  children: const [
                    Spacer(),
                    Center(
                      child: Text(
                        "Cart is empty...",
                        style: TextStyle(
                          fontFamily: 'Burrito',
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                            color: Color(0xFF469cd5),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '\$${value.calculateTotal()}',
                          style: const TextStyle(
                            color: Color(0xFF469cd5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF469cd5),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: const [
                          Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Color(0xFF469cd5),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF469cd5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
      backgroundColor: const Color(0xFF469cd5),
    );
  }
}
