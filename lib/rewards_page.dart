import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key, required int lastindex});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int selectedIndex = 0; // 0 = Coins, 1 = Savings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 97, 52, 234),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/219/219983.png',
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 97, 52, 234),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Saving kay liye login krein',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        selectedIndex == 0
                            ? "DC Coins kamayein aur mazeed discounts payein!"
                            : "Apni savings dekhein aur fayda uthayein!",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 97, 52, 234),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => selectedIndex = 0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 0
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "COINS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: selectedIndex == 0
                                          ? const Color.fromARGB(
                                              255,
                                              97,
                                              52,
                                              234,
                                            )
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => selectedIndex = 1),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "SAVINGS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: selectedIndex == 1
                                          ? const Color.fromARGB(
                                              255,
                                              97,
                                              52,
                                              234,
                                            )
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.ticket,
                              color: Colors.purple.shade700,
                              size: 40,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Promo Codes',
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.handsClapping,
                              color: Colors.blue.shade700,
                              size: 40,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Share & Earn',
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    'Game Khelein!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Jeetein latadaad inamaat, games khel k',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.green.shade700,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.sports_cricket,
                              color: Colors.green.shade700,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'DC Cricket',
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors
                                    .orangeAccent
                                    .shade700, // border color
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              FontAwesomeIcons.dharmachakra,
                              color: Colors.orangeAccent.shade700,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Spin & Win',
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    Colors.blueAccent.shade700,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              FontAwesomeIcons.puzzlePiece,
                              color: Colors.blueAccent.shade700,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'DC Trivia',
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(color: Colors.grey.shade300, thickness: 1),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Reward jeetne k tareeqe',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219983.png')
                          ),
                          Text(
                              'Share & Earn',
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                          ),
                          Text(
                              'Promo Codes',
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: Colors.black,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
