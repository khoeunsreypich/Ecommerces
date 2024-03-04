import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBrand extends StatelessWidget {
  const HomeBrand({super.key});

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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://cdn.icon-icons.com/icons2/2699/PNG/512/adidas_logo_icon_168690.png'),
                          ))),
                  Text(
                    'Adidas',
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
