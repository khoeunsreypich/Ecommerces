import 'package:ecommerce/Views/Home/drawer.dart';
import 'package:flutter/material.dart';

import 'home_brand.dart';
import 'home_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: globals.pageBackgroundColor,
      appBar: AppBar(
          title: Text('Company name'),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              })),
      body: SingleChildScrollView(
        child: SizedBox(
         // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                Text('Welcome to Laza'),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'Choose Brand',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width * .90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                      itemBuilder: (context,index)=> HomeBrand(),),
                ),

                Text(
                  'New Arrival ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.98,
                  width: MediaQuery.of(context).size.width * .90,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
               itemBuilder: (context,index)=>HomeProduct(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerScreen(),
    );
  }
}
