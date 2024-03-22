import 'package:ecommerce/ViewModels/product_vm.dart';
import 'package:flutter/material.dart';

import '../../Models/Request/product.dart';

class HomeProduct extends StatefulWidget {
  HomeProduct({super.key, this.products});

  Datum? products;

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  var productViewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: MediaQuery.of(context).size.height*.50,
       // height: 360,
        width: MediaQuery.of(context).size.width * .60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.yellowAccent,

                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width*.50,
                        child: Image.network(
                          'https://cms.istad.co${widget.products?.attributes?.thumbnail?.data?.attributes?.url}',
                          fit: BoxFit.fill,
                            ),
                      )),
                ),
                SizedBox(height: 8,),
                Column(
                  children: [Text('${widget.products!.attributes!.title!}',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('${widget.products!.attributes!.rating!} *****',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('\$ ${widget.products!.attributes!.price!}',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
