import 'package:ecommerce/Data/network/api_service.dart';
import 'package:ecommerce/Models/Request/product.dart';
import 'package:ecommerce/Res/url.dart';

class ProductRepository{
  var apiservice = ApiService();
  Future<dynamic> getAllProducts() async {
    try{
      dynamic response = await apiservice.getApi(ClsUrl.getAllProducts);
      return productsFromJson(response);
    }catch (exception){
      rethrow;
    }
  }
}