
import 'package:ecommerce/Models/Request/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({super.key,this.products});
  Datum? products;



  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
        child: Center(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 7, 255, 222),
                child: SizedBox(
                  height: 300,
                  width: 250,
                  child: Image.network('https://cms.istad.co${widget.products?.attributes?.thumbnail?.data?.attributes?.url.toString()}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(widget.products!.attributes!.title!.toString()),
              Text(widget.products!.attributes!.description!.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
