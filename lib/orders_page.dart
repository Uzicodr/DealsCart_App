import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key, required this.lastindex});

  final int lastindex;
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _grocerySelected = 0; 
  int _foodSelected = 0; 

  final List<String> groceryTabs = ['All', 'Upcoming', 'Delivered', 'Cancelled', 'Returned'];
  final List<String> foodTabs = ['All', 'Upcoming', 'Delivered', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                "My Orders",
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 97, 97),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.solidComment,
                color: Color.fromARGB(255, 97, 52, 234),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Color.fromARGB(255, 98, 97, 97),
            tabs: [
              Tab(text: 'Grocery & More'),
              Tab(text: 'Food'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: groceryTabs.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == _grocerySelected;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _grocerySelected = index;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected ? Colors.blue : Colors.white,
                            foregroundColor: isSelected ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            groceryTabs[index],
                            style: const TextStyle(fontFamily: 'Poppins-Regular'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Showing ${groceryTabs[_grocerySelected]} Orders',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

         
            Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: foodTabs.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == _foodSelected;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _foodSelected = index;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: isSelected ? Colors.blue : Colors.white,
                            foregroundColor: isSelected ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            foodTabs[index],
                            style: const TextStyle(fontFamily: 'Poppins-Regular'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Showing ${foodTabs[_foodSelected]} Orders',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
