

import 'package:ecommerce/Views/Home/drawer.dart';
import 'package:flutter/material.dart';

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
      body:Padding(
        padding: const EdgeInsets.only(left: 15,top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),
            Text('Welcome to Laza'),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text('Choose Brand',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            ),
            SizedBox(
              height: 15,
            ),
            Container(

              height: 60,
              width: 150,
              decoration:BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    SizedBox(
                      height: 50,
                        width: 50,
                        child: Container(
                          height: 100,
                         width: 100,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Colors.white,

                         ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network('https://cdn.icon-icons.com/icons2/2699/PNG/512/adidas_logo_icon_168690.png'),
                            ))),
                   Text('Adidas',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),

                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text('New Arrival ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

          Expanded(
            flex: 1,
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                          width: 210,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                              child: Image.network('https://i0.wp.com/blog.watermarkup.com/wp-content/uploads/2022/03/clothing-photography-ideas-18.jpeg?resize=500%2C750')))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                          width: 210,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                              child: Image.network('https://i0.wp.com/blog.watermarkup.com/wp-content/uploads/2022/03/clothing-photography-ideas-18.jpeg?resize=500%2C750')))
                    ],
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
      drawer: DrawerScreen(),
    );
  }
}

