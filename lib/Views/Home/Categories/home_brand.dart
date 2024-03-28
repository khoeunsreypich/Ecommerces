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
      width: MediaQuery.of(context).size.width * .40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
               color: Colors.grey.shade200,
              // color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(

                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                            '${widget.category?.attributes?.iconUrl}'),
                      )),
                  Padding(
                    padding:new  EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width:70,
                      child: Text(
                        '${widget.category?.attributes?.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),

                      ),
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
