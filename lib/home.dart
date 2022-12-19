import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              topSection(context),
              categorySection(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget topSection(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Container(
    height: 270,
    width: width,
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
    color: const Color(0xFF2A6143),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '25% Off Selller\nFees All Week',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 170,
              margin: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sell & Shop Now',
                      style: TextStyle(
                          fontSize: 16.5, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: DotsIndicator(
                dotsCount: 3,
                position: 2,
                decorator: DotsDecorator(
                  spacing: const EdgeInsets.all(5.0),
                  color: const Color(0xFF80A997),
                  size: const Size.square(8.0),
                  activeSize: const Size.square(8.0),
                  activeColor: Colors.white,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget categorySection() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text('Shop By Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ),
        SizedBox(
          width: 1000,
          height: 180,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: [
              categories('images/sneakers.png', 'Sneakers', 'F'),
              categories('images/shoes.png', 'Shoes', 'F'),
              categories('images/apparel.png', 'Apparel', 'F'),
              categories('images/eletronics.png', 'Eletronics', 'F'),
              categories('images/accessories.png', 'Accessories', 'T'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget categories(String img, String title, String bool) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 15),
              padding: const EdgeInsets.all(15),
              height: 95,
              width: 105,
              color: const Color(0xFFF5F5F2),
              child: Image.asset(img)),
          Text(title,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ],
      ),
      if (bool == 'F') const Padding(padding: EdgeInsets.only(right: 15)),
    ],
  );
}
