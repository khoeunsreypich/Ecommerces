
import 'package:ecommerce/Models/response/product.dart';
import 'package:ecommerce/ViewModels/image_viewModel.dart';
import 'package:ecommerce/Views/Home/Products/add_products.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
   ProductDetails({super.key,this.products});
  Datum? products;




  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool descTextShowFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
          child: Center(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 7, 255, 222),
                  child: SizedBox(
                    height: 300,
                    width: 250,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProducts(),));
                        },
                        child: Image.network('https://cms.istad.co${widget.products?.attributes?.thumbnail?.data?.attributes?.url.toString()}',
                          fit: BoxFit.fill,
                        ),
                      ),
                  ),
                ),
                Text(widget.products!.attributes!.title!.toString()),
                Text(widget.products!.attributes!.description!.toString(),
                maxLines: descTextShowFlag ? 15 : 2,textAlign: TextAlign.start,
                ),
                InkWell(
                  onTap: (){setState(() {
                    descTextShowFlag=!descTextShowFlag;
                  });},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      descTextShowFlag? Text('Show Less',style: TextStyle(color: Colors.blue),):
                          Text('Show More',style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
