import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'item.dart';

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
              recommendSection(context),
              brandSection(),
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
    height: 250,
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

Widget title(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
  );
}

Widget categorySection() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Shop By Category'),
        SizedBox(
          width: 1000,
          height: 150,
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
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
      if (bool == 'F') const Padding(padding: EdgeInsets.only(right: 15)),
    ],
  );
}

Widget recommendSection(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title('Recommended For You'),
            seeAllButton(),
          ],
        ),
        SizedBox(
          width: 1000,
          height: 305,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: [
              products(
                  'images/recomm1.png',
                  'adidas Yeezy Slide Bone (2022 Restock)',
                  'Lowest Ask',
                  106,
                  116,
                  'F',
                  context),
              products(
                  'images/recomm2.png',
                  'Nike Dunk Low Retro White Black Panda (2022 Restock)',
                  'Lowest Ask',
                  158,
                  161,
                  'F',
                  context),
              products(
                  'images/recomm3.png',
                  'Jordan 1 Retro Low OGZion Williamson Vood',
                  'Lowest Ask',
                  205,
                  229,
                  'T',
                  context),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget seeAllButton() {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          child: const Text('See All',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF226243))),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFF226243),
              size: 18,
            )),
      ],
    ),
  );
}

Widget products(String img, String title, String desc, int price, int sale,
    String bool, BuildContext context) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFEBEBEB),
          ),
        ),
        margin: const EdgeInsets.only(top: 20, bottom: 15),
        padding: const EdgeInsets.all(15),
        height: 400,
        width: 150,
        child: productText(img, title, desc, price, sale, bool, context),
      ),
      if (bool == 'F') const Padding(padding: EdgeInsets.only(right: 15)),
    ],
  );
}

Widget productText(String img, String title, String desc, int price, int sale,
    String bool, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.only(bottom: 30),
        child: GestureDetector(
          child: Hero(
            tag: img,
            child: Image.asset(img),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ItemPage()),
            );
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 7),
        child: Text(title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, color: Colors.black)),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 7),
        child: Text(desc,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF626262))),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 7),
        child: Text('\$$price',
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      Text('Last Sale: \$$sale',
          style: const TextStyle(fontSize: 13, color: Color(0xFF626262))),
    ],
  );
}

Widget brandSection() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Popular Brands'),
        SizedBox(
          width: 1000,
          height: 170,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: [
              brands('images/brand1.png', 'Jordan', 'images/logo1.png', 'F'),
              brands('images/brand2.png', 'Supreme', 'images/logo2.png', 'F'),
              brands('images/brand3.png', 'Bearbrick', 'images/logo3.png', 'T'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget brands(String img, String title, String logo, String bool) {
  return Row(
    children: [
      Container(
        color: const Color(0xFFF5F5F2),
        margin: const EdgeInsets.only(top: 20, bottom: 15),
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(img, fit: BoxFit.fitWidth),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 13,
                    child: Image.asset(logo, fit: BoxFit.fitWidth),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      if (bool == 'F') const Padding(padding: EdgeInsets.only(right: 15)),
    ],
  );
}
