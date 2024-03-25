import 'package:ecommerce/Data/response/status.dart';
import 'package:ecommerce/ViewModels/category_vm.dart';
import 'package:ecommerce/ViewModels/product_vm.dart';
import 'package:ecommerce/Views/Home/Products/add_products.dart';
import 'package:ecommerce/Views/Home/Products/product_details.dart';
import 'package:ecommerce/Views/Home/drawer.dart';
import 'package:ecommerce/Views/Skeleton/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Categories/home_brand.dart';
import 'Products/home_product.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,this.id});
  int ?id;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _productViewModel = ProductViewModel();
  final _categoryViewModel = CategoryViewModel();
  @override
  void initState() {
    super.initState();
    _productViewModel.getAllProduct();
    _categoryViewModel.getAllCategory();
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
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddProducts(),),);
                }, icon: Icon(Icons.add)),
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
                  child:ChangeNotifierProvider(
                    create: (context) => _categoryViewModel,
                    child: Consumer<CategoryViewModel>(
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
                                  var categories = viewModel.response.data!.data![index];
                                  return HomeBrand(category:categories,);
                                });
                          case Status.ERROR:
                            return Text('Error');
                        }
                      },
                    ),
                  ),
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
                  //height: 350,
                 height: MediaQuery.of(context).size.height*.40,
                // width: MediaQuery.of(context).size.width * .50,
                  child: ChangeNotifierProvider(
                    create: (context) => _productViewModel,
                    child: Consumer<ProductViewModel>(
                        builder: (context,viewModel,_){
                    switch(viewModel.response.status!){
                      case Status.LOADING:
                        return ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: 11,
                            itemBuilder: (context,index) => ProductCardSkeleton());
                      case Status.COMPLETED:
                      return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 11,
                                  itemBuilder: ( context, index) {
                                    var product = viewModel.response.data!.data![index];
                                    return InkWell(
                                        child: HomeProduct(products: product,),
                                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(products: product,),));},
                                    );
                                  }
                                    );

                              // SwipeTo(
                              //   child: ListTile(
                              //     onTap:() {
                              //       var product = viewModel.response.data!.data![index];
                              //        HomeProduct(products: product,);
                              //       Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(products: product,),));},
                              //   ),
                              // );

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
