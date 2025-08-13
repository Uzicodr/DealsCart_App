import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text('Bill Summary',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.box, color: Colors.black,size: 14,),
                        SizedBox(width: 10),
                        Text('Items total',style: TextStyle(fontFamily: 'Poppins')),
                        Spacer(),
                        Text('Rs. 0',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.truck, color: Colors.black,size: 14,),
                        SizedBox(width: 10),
                        Text('Handling fee',style: TextStyle(fontFamily: 'Poppins',decoration: TextDecoration.underline)),
                        SizedBox(width: 10,),
                        Icon(FontAwesomeIcons.caretDown, color: Colors.black,size: 14),
                        Spacer(),
                        Text('Rs. 0',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 50,),
                    Divider(color: Colors.grey.shade300, thickness: 1,),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Grand Total',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text('Rs. 0',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Rs. 0',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w800,fontSize: 16),),
                              SizedBox(width: 20,),
                              VerticalDivider(color: Colors.black, thickness: 2,),
                              Text('0 Item(s)',style: TextStyle(fontFamily: 'Poppins'),)
                            ],
                          ),
                          Text("You've saved Rs. 0", style:TextStyle(fontFamily: 'Poppins',color: Colors.greenAccent.shade200,fontSize: 14,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 97, 52, 234),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('PROCEED',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
