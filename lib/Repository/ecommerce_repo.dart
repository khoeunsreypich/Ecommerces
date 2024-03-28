import 'dart:convert';

import 'package:ecommerce/Data/network/api_service.dart';
import 'package:ecommerce/Models/Request/category.dart';
import 'package:ecommerce/Models/Request/product_request.dart';
import 'package:ecommerce/Models/response/product.dart';
import 'package:ecommerce/Res/url.dart';

class EcommerceRepository{
  var apiService = ApiService();
  Future<Products> getAllProducts() async {
    try{
      dynamic response = await apiService.getApi(ClsUrl.getAllProductUrl);
      return productsFromJson(response);
    }catch (exception){
      rethrow;
    }
  }
  Future<Categories> getAllCategories() async{
    try{
      var response = await apiService.getApi(ClsUrl.getAllCategoryUrl);
      return categoriesFromJson(response);
    }catch (exception){
      rethrow;
    }
  }

  Future<bool> postProducts(data)async{
    //print('restaurant id $id');

    var productRequest = productRequestToJson(data);
    //var url = isUpdate? ClsUrl.postProductUrl:ClsUrl.postProductUrl;
   // print('Posting ..........');
   var url =ClsUrl.postProductUrl;
    dynamic response = await apiService.postProduct( url,productRequest);
    return response;
  }

}