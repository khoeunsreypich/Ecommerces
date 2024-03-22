import 'package:ecommerce/Models/Request/category.dart';
import 'package:flutter/material.dart';

class HomeBrand extends StatefulWidget {
   HomeBrand({super.key,this.category});
  Datum? category ;

  @override
  State<HomeBrand> createState() => _HomeBrandState();
}

class _HomeBrandState extends State<HomeBrand> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      //width: 300,
      width: MediaQuery.of(context).size.width * .35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
           // width: MediaQuery.of(context).size.width * .35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: Image.network(
                              '${widget.category?.attributes?.iconUrl}'))),
                  Padding(
                    padding: new EdgeInsets.only(right: 10.0),
                    child: Text(
                      '${widget.category?.attributes?.title}',
                      overflow:TextOverflow.ellipsis,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
