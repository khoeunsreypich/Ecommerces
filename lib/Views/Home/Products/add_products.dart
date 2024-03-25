


import 'package:ecommerce/ViewModels/product_vm.dart';
import 'package:flutter/material.dart';

import '../../../Models/Request/product.dart';
class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final titleController =  TextEditingController();
  final priceController = TextEditingController();
  final rattingController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final createdAtController = TextEditingController();
  final updatedAdController = TextEditingController();
  final publishedAtController = TextEditingController();
  final categoryController = Category();
  final _productViewModel = ProductViewModel();
  final thumbnailController = Thumbnail();
  var imgFile;
  var productId;
  var imgId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Product Name',border: OutlineInputBorder()
                ),
              ),

              TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: 'Product Price',border: OutlineInputBorder()
                ),
              ),

              TextField(
                controller: rattingController,
                decoration: InputDecoration(
                    hintText: 'Ratting',border: OutlineInputBorder()
                ),
              ),

              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Product Descriptions',border: OutlineInputBorder()
                ),
              ),

              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                    hintText: 'Product qty',border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: (){_addNew();},
                child: Text('Add New'),
              ),
            ],
          ),
        ),
      ) ,

    );
  }
  void _addNew (){
    var addProduct = Products(
         data :DatumAttributes(
            title: titleController.text,
            price: priceController.text,
            description: descriptionController.text,
            quantity: quantityController.text,
            rating: rattingController.text,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            publishedAt: DateTime.now(),
            category: categoryController,
            thumbnail: thumbnailController,
          ));
    _productViewModel.postProducts(addProduct, id: productId);
  }

}
