import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black, size: 25)),
        backgroundColor: const Color(0xFFECECEC),
        elevation: 0.0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.black, size: 25)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.ios_share_rounded,
                    color: Colors.black, size: 25)),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buySellSection(),
              const Divider(
                thickness: 1,
              ),
              productSection(context),
              priceSection(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buySellSection() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buySellButton(const Color(0xFF2A6143), 106, 4, const Color(0xFF083D20),
            'Buy', 'Bid'),
        buySellButton(
            Colors.black, 152, 13, const Color(0xFF5E5E5E), 'Sell', 'Ask'),
      ],
    ),
  );
}

Widget buySellButton(
    Color? color, int price, int num, Color? divider, String opt, String or) {
  return TextButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: Colors.black,
    ),
    onPressed: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: 170,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: Text('\$$price',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Text('Size: US M $num',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          verticalDivider(divider),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: Text(opt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Text('Or $or',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget verticalDivider(Color? divider) {
  return VerticalDivider(
    thickness: 1,
    color: divider,
  );
}

Widget productSection(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text('adidas Yeezy Slide',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const Text('Bone (2022 Restock)', style: TextStyle(fontSize: 17)),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            color: const Color(0xFFF5F3F1),
            child: const Text('Condition: New',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
          ),
          GestureDetector(
            child: Hero(
              tag: 'images/recomm1.png',
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Image.asset('images/recomm1.png'),
              ),
            ),
            onTap: () {},
          ),
          sellingFast(context),
        ],
      ));
}

Widget sellingFast(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1,
        color: const Color(0xFFF4EDD4),
      ),
    ),
    padding: const EdgeInsets.all(20),
    width: width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const Icon(Icons.flash_on_sharp,
              color: Color(0xFFEEBD47), size: 35),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text('This Product Is Selling Fast',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const Text('843 Purchases In The Last 3 Days',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
  );
}

Widget priceSection() {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    'Last Sale:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              const Text(
                '\$144',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_drop_up, color: Color(0xFF276243), size: 40),
                  Text(
                    '\$27 (23.08%)',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF276243)),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black, width: 1),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'View Market Data',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ));
}
