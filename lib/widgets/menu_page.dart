import 'package:flutter/material.dart';
import 'package:hermanos/widgets/intro_page.dart';
import 'package:hermanos/widgets/support_page.dart';
import 'package:provider/provider.dart';

import '../models/menu_model.dart';
import 'cart_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4d70d),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(child: Consumer<MenuModel>(
          builder: (context, value, child) {
            return Card(
              color: Colors.transparent,
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const IntroPage();
                        },
                      ),
                    ),
                    color: const Color(0xFFd92027),
                    iconSize: 24,
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontFamily: 'Burrito',
                      fontSize: 36,
                      color: Color(0xFFd92027),
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      Positioned(
                        right: 38,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SupportPage();
                            }));
                          },
                          icon: const Icon(Icons.chat_outlined),
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: IconButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CartPage();
                              },
                            ),
                          ),
                          icon: const Icon(Icons.shopping_basket),
                        ),
                      ),
                      if (value.cartItems.length != 0)
                        Positioned(
                          top: 5,
                          right: 8,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(90),
                            ),
                            child: Center(
                              child: Text(
                                "${value.cartItems.length}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        )),
      ),
      body: Consumer<MenuModel>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFd92027),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 240,
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                              child: Image.asset(
                                "${value.burgerMenu[index][2]}",
                                height: 130,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 3),
                              child: Text(
                                '${value.burgerMenu[index][0]}',
                                style: const TextStyle(
                                  fontFamily: 'Burrito',
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${value.burgerMenu[index][1]}',
                                    style: const TextStyle(
                                      fontFamily: 'Burrito',
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: FloatingActionButton(
                                      backgroundColor: const Color(0xFFd92027),
                                      onPressed: () {
                                        Provider.of<MenuModel>(context,
                                                listen: false)
                                            .add1ToCart(index);
                                      },
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: value.burgerMenu.length,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 8,
                  ),
                  child: Text(
                    'Beverages',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Burrito',
                      color: Color(0xFFd92027),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFd92027),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 190,
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                              child: Image.asset(
                                "${value.beverages[index][2]}",
                                height: 80,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 3),
                              child: Text(
                                '${value.beverages[index][0]}',
                                style: const TextStyle(
                                  fontFamily: 'Burrito',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${value.beverages[index][1]}',
                                    style: const TextStyle(
                                      fontFamily: 'Burrito',
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: FloatingActionButton(
                                      backgroundColor: const Color(0xFFd92027),
                                      onPressed: () {
                                        Provider.of<MenuModel>(context,
                                                listen: false)
                                            .add2ToCart(index);
                                      },
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: value.beverages.length,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 8,
                  ),
                  child: Text(
                    'Sauces',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Burrito',
                      color: Color(0xFFd92027),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 60,
                    left: 4,
                    right: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd92027),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 190,
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Image.asset(
                                  "${value.sauces[index][2]}",
                                  height: 80,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, top: 3),
                                child: Text(
                                  '${value.sauces[index][0]}',
                                  style: const TextStyle(
                                    fontFamily: 'Burrito',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${value.sauces[index][1]}',
                                      style: const TextStyle(
                                        fontFamily: 'Burrito',
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: FloatingActionButton(
                                        backgroundColor:
                                            const Color(0xFFd92027),
                                        onPressed: () {
                                          Provider.of<MenuModel>(context,
                                                  listen: false)
                                              .add3ToCart(index);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: value.beverages.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
