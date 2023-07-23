import 'package:flutter/material.dart';
import 'package:hermanos/widgets/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 60, right: 60, top: 120, bottom: 80),
            child: Image.asset('assets/images/los_pollos.png'),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Hello and Welcome to the Los Pollos Hermanos',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
                fontFamily: 'Burrito',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text('\u00a9 Gustavo Fring\'s specials'),
          const Spacer(),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MenuPage();
            })),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xFFd92027),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12,
                ),
                child: Text(
                  'Order Now',
                  style: TextStyle(
                    color: Color(0xFFf4d70d),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
