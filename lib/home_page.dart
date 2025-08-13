import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'orders_page.dart';
import 'cart_page.dart';
import 'rewards_page.dart';
import 'wallet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> hints = [
    "Search Aalu",
    "Search Oil",
    "Search Rozana",
    "Search Piyaaz",
  ];

  int currentIndex = 0;
  late String currentHint;
  final Random random = Random();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentHint = hints[random.nextInt(hints.length)];

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentHint = hints[random.nextInt(hints.length)];
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 97, 52, 234) 
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      const Icon(Icons.menu, color: Colors.black),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Text(
                                "Deliver to ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 98, 97, 97),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(FontAwesomeIcons.caretDown, color: Colors.black,size: 14),
                            ],
                          ),
                          Text(
                            "Karachi",
                            style: TextStyle(
                              color: Color.fromARGB(255, 98, 97, 97),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const FaIcon(
                        FontAwesomeIcons.solidComment,
                        color: Color.fromARGB(255, 97, 52, 234),
                      ),
                    ],
                  ),
                ),
        
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: currentHint,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
        
                // Category Tabs
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryTab(Icons.grid_view, "All"),
                      categoryTab(Icons.shopping_basket, "Grocery"),
                      categoryTab(Icons.fastfood, "Food"),
                      categoryTab(Icons.brush, "Beauty"),
                      categoryTab(FontAwesomeIcons.shirt, "Fashion"),
                      categoryTab(FontAwesomeIcons.lifeRing, "Lifestyle"),
                      categoryTab(FontAwesomeIcons.tv, "Electronic"),
                    ],
                  ),
                ),
        
                SizedBox(height: 30),
        
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://dealcart.io/_next/image?url=https%3A%2F%2Fadmin.dealcart.io%2Fbanner%2Ffull-1746691881675-fashion%2520-%2520Banner..webp&w=1920&q=75',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
        
                const SizedBox(height: 20),
        
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Shop by Category",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
        
                const SizedBox(height: 8),
        
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersPage()));
          } else if(index==2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletPage()));
          } else if(index==3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RewardsPage()));
          } else if(index==4){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.basketShopping),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.paypal),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.crown),
            label: "Rewards",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: "Cart"),
        ],
      ),
    );
  }

  Widget categoryTab(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: 200,
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(height: 4),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
