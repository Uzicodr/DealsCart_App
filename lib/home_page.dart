import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'orders_page.dart';
import 'cart_page.dart';
import 'rewards_page.dart';
import 'wallet_page.dart';
import 'api_fetcher.dart';
import 'product_model.dart';
import 'shimer_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.lastindex});
  final int lastindex;

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

  final List<Widget> _screens = [
    const HomeTab(),
    const OrdersPage(lastindex: 0),
    const WalletPage(lastindex: 0),
    const RewardsPage(lastindex: 0),
  ];

  final List<PreferredSizeWidget> _appBars = [
    AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.menu, color: Colors.black),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Deliver to ",
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 97, 97),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
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
          Icon(
            FontAwesomeIcons.caretDown,
            color: Color.fromARGB(255, 98, 97, 97),
            size: 18,
          ),
          const Spacer(),
          const Icon(
            FontAwesomeIcons.solidComment,
            color: Color(0xff6366f1),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
    ),
    AppBar(
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "DC Pay",
            style: TextStyle(
              color: Color.fromARGB(255, 98, 97, 97),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    ),
    AppBar(
      title: const Text(
        "Rewards",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color(0xff6366f1),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {},
      ),
    ),
  ];

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
      appBar: (currentIndex == 2 || currentIndex == 3)
          ? _appBars[currentIndex - 1]
          : (currentIndex == 0)
              ? _appBars[0]
              : null,
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xff6366f1),
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else {
            setState(() {
              currentIndex = index;
            });
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
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<Product>> products;
  final List<String> hints = [
    "Search Aalu",
    "Search Oil",
    "Search Rozana",
    "Search Piyaaz",
  ];
  final Random random = Random();
  String currentHint = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentHint = hints[random.nextInt(hints.length)];
    final apiFetcher = ApiFetcher();
    products = apiFetcher.fetchProducts();
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
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
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
                  ),
                  const SizedBox(height: 30),
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
                  FutureBuilder<List<Product>>(
                    future: products,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
      child: ShimmerPlaceholder(),
    ),
  );
} else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              "Failed to load",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(child: Text("No products available")),
                        );
                      }
                      final products = snapshot.data!;
                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.network(
                                      product.image,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rs. ${product.price}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Icon(Icons.add, color: Colors.grey),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryTab(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
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
            Icon(icon, color: Color(0xff6366f1)),
            const SizedBox(height: 4),
            Text(text, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
