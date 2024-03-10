import 'package:flutter/cupertino.dart';

import '../../Models/Request/product.dart';

class HomeProduct extends StatelessWidget {
  HomeProduct({this.products});

  Datum? products;

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
       // height: MediaQuery.of(context).size.height*.98,
        height: 360,
        width: MediaQuery.of(context).size.width * .90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 270,
                      width: 180,
                      // child: Image.network(
                      //   'https://cms.istad.co${restaurant!.attributes!.picture!.data!.attributes!.url!}',
                      //   fit: BoxFit.fill,
                      // ),
                      child: Image.network(
                        'baseUrl${products?.attributes?.thumbnail}'
                          ),
                    )),
                SizedBox(height: 8,),
                Column(
                  children: [Text('Adidas For Girl',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('Fashion',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('\$ 99',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
              ],
            ),

            Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 270,
                          width: 180,
                          child: Image.network(
                              'https://i0.wp.com/blog.watermarkup.com/wp-content/uploads/2022/03/clothing-photography-ideas-18.jpeg?resize=500%2C750'),
                        )),
                    //SizedBox(height: 8,),
                  ],
                ),
                SizedBox(height: 8,),
                Column(
                  children: [Text('Adidas For Girl',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('Fashion',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
                Column(
                  children: [Text('\$ 99',style: TextStyle(fontWeight: FontWeight.w500),)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
