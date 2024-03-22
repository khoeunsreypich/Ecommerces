import 'package:ecommerce/Data/network/api_service.dart';
import 'package:ecommerce/Models/Request/category.dart';
import 'package:ecommerce/Models/Request/product.dart';
import 'package:ecommerce/Res/url.dart';

class ProductRepository{
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

}