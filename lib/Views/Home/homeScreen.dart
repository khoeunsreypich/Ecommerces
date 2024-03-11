import 'package:ecommerce/Data/response/status.dart';
import 'package:ecommerce/ViewModels/product_vm.dart';
import 'package:ecommerce/Views/Home/drawer.dart';
import 'package:ecommerce/Views/Skeleton/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_brand.dart';
import 'home_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _productViewModel = ProductViewModel();
  @override
  void initState() {
    super.initState();
    _productViewModel.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: globals.pageBackgroundColor,
      appBar: AppBar(
          title: Text('Back'),
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
                Text('Welcome to Laza',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text('Search',style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Choose Brand',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width * .90,
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context,index)=> HomeBrand(),),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New Arrival ',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(height: 15,),



                SizedBox(
                  height: 350,
                 //height: MediaQuery.of(context).size.height*.98,
                // width: MediaQuery.of(context).size.width * .90,
                  child: ChangeNotifierProvider(
                    create: (context) => _productViewModel,
                    child: Consumer<ProductViewModel>(
                        builder: (context,viewModel,_){
                    switch(viewModel.response.status!){
                      case Status.LOADING:
                        return ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context,index) => ProductCardSkeleton());
                      case Status.COMPLETED:
                      return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ( context, index){
                              var product = viewModel.response.data!.data![index];
                              return HomeProduct(products: product,);
                            });
                      case Status.ERROR:
                        return Text('Error');
                    }
                        },
                    ),
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
