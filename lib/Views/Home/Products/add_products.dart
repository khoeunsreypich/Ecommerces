


import 'package:ecommerce/Data/response/status.dart';
import 'package:ecommerce/Models/Request/product_request.dart';
import 'package:ecommerce/ViewModels/image_viewModel.dart';
import 'package:ecommerce/ViewModels/product_request_vm.dart';
import 'package:ecommerce/ViewModels/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Models/response/product.dart';
class AddProducts extends StatefulWidget {
   AddProducts({super.key,this.isFromUpdate,this.products});
  bool?  isFromUpdate;
  Datum? products;

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
  final _productRequestViewModel = ProductRequestViewModel();
  //final thumbnailController = Thumbnail();
  final _imageViewModel = ImageViewModel();
  var imgFile;
  var productId;
  var imgId;
  var sizeBox = SizedBox(height: 15,);
  @override
  // void initState() {
  //   super.initState();
  //   _imageViewModel.uploadImage();
  // }
  // void initState() {
  //   super.initState();
  //   checkIfFromUpdate();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 95,left: 15,right: 15),
            child: Column(
              children: [
                // Image.network('https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                // ),
                ChangeNotifierProvider(
                  create: (context) => _imageViewModel,
                  child: Consumer<ImageViewModel>(
                    builder: (ctx,viewModel,_) {
                      // if(widget.isFromUpdate!){
                      // return InkWell(
                      // onTap: (){
                      //   _getImageFromSource(source: 'camera');
                      // },
                      //   // child:  Image.network('https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                      //   // ),
                      // child: Image.network(
                      // 'https://cms.istad.co${widget.products!.attributes!.thumbnail!.data!.attributes!.url}'
                      // ),
                      // );
                      // }
                      if(viewModel.response.status == null){
                        return InkWell(
                          onTap: () {
                            _getImageFromSource(source: 'gallery');
                          },
                          child: Image.network(
                            'https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                            fit: BoxFit.contain,
                          ),
                        );
                      }
                      switch(viewModel.response.status!){
                        case Status.LOADING:
                          return const Center(
                              child: CircularProgressIndicator());
                        case Status.COMPLETED:
                          //when upload success it's assign id tuk
                          imgId = viewModel.response.data[0].id;
                          //var categories = viewModel.response.data!.data![index];
                          return InkWell(
                            onTap: () {
                              _getImageFromSource(source: 'camera');
                            },
                            child: SizedBox(
                              height: 350,
                              width: 250,
                              child: Image.network(
                                  'https://cms.istad.co${viewModel.response.data[0].url!}'),
                            ),
                          );
                        case Status.ERROR:
                          return Text(viewModel.response.message!);
                      }
                    },
          ),
                ),



                sizeBox,
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Product Name',border: OutlineInputBorder()
                  ),
                ),
                sizeBox,
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                      hintText: 'Product Price',border: OutlineInputBorder()
                  ),
                ),
                sizeBox,
                TextField(
                  controller: rattingController,
                  decoration: InputDecoration(
                      hintText: 'Ratting',border: OutlineInputBorder()
                  ),
                ),
                sizeBox,
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: 'Product Descriptions',border: OutlineInputBorder()
                  ),
                ),
                sizeBox,
                TextField(
                  controller: quantityController,
                  decoration: InputDecoration(
                      hintText: 'Product qty',border: OutlineInputBorder()
                  ),
                ),
                sizeBox,

                ChangeNotifierProvider(
                  create: (context) => _productRequestViewModel,
                  child: Consumer<ProductRequestViewModel>(
                    builder: (ctx, viewModel, _) {
                      if (viewModel.response.status==null) {
                        return ElevatedButton(
                            onPressed: () {
                              _addNew();
                            },
                            // child: widget.isFromUpdate!
                            //     ? Text('Update')
                            //     : Text('Save'));
                            child: Text('Save'));
                      }
                      switch (viewModel.response.status!) {
                        case Status.LOADING:
                          return const Center(child: CircularProgressIndicator());
                        case Status.COMPLETED:
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(ctx).showSnackBar(
                                const SnackBar(content: Text('Post Success')));
                          });
                          return ElevatedButton(
                              onPressed: () {
                                _addNew();
                              },
                              child: Text('Save'));
                        case Status.ERROR:
                          return Text(viewModel.response.message!);
                      }
                    },
                  ),
                )

              ],
            ),
          ),
        ),
      ) ,

    );
  }

  void _addNew (){
    var addProduct = ProductRequest(
      data: Data(
        title: titleController.text,
        rating: rattingController.text,
        description: descriptionController.text,
        quantity: quantityController.text,
       // category: categoryController.toString(),
        thumbnail: imgId.toString(),
        price: priceController.text,

      )
    );
    _productRequestViewModel.postProducts(addProduct);
  }
  _getImageFromSource({source}) async {
    // print('picking image ');
    XFile? pickedFile = await ImagePicker().pickImage(
        source: source == "gallery" ? ImageSource.gallery: ImageSource.camera);
    if (pickedFile != null) {
      // uploading image to server
      _imageViewModel.uploadImage(pickedFile.path);
      // setState(() {
      //   isPicked = true;
      //   imageFile = File(pickedFile.path);
      // });
      // print('Picked Image : ${File(pickedFile.path)}');
    }
  }

void checkIfFromUpdate(){
    if(widget.isFromUpdate!){
      titleController.text=widget.products!.attributes!.title.toString();
      rattingController.text=widget.products!.attributes!.rating.toString();
      descriptionController.text=widget.products!.attributes!.description.toString();
      quantityController.text=widget.products!.attributes!.quantity.toString();
      priceController.text=widget.products!.attributes!.price.toString();
      productId=widget.products!.id;
      imgId=widget.products!.attributes!.thumbnail!.data!.id;
    }
}


}
