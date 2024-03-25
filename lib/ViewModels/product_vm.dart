
//
// class RestaurantViewModel extends ChangeNotifier {
//
//   final _restaurantRepo = RestaurantRepository();
//   ApiResponse<Restaurant> response = ApiResponse.loading();
//
//   setRestaurantList(response) {
//     this.response = response;
//     notifyListeners();
//   }
//
//   Future<dynamic> getAllRestaurant() async {
//     await _restaurantRepo.getAllRestaurants()
//         .then((restaurant) => setRestaurantList(ApiResponse.completed(restaurant)))
//         .onError((error, stackTrace)
//     => setRestaurantList(ApiResponse.error(stackTrace.toString())));
//   }
//
// }
import 'package:ecommerce/Data/response/api_response.dart';
import 'package:ecommerce/Repository/ecommerce_repo.dart';
import 'package:flutter/cupertino.dart';

import '../Models/Request/product.dart';

class ProductViewModel extends ChangeNotifier{
  final _productRepo = EcommerceRepository();
  ApiResponse<Products> response = ApiResponse.loading();

  setProductList(response) {
     this.response = response;
     notifyListeners();
  }
  Future<dynamic> getAllProduct() async {
   await _productRepo.getAllProducts()
      .then((product) => setProductList(ApiResponse.completed(product)))
       .onError((error, stackTrace)
    => setProductList(ApiResponse.error(stackTrace.toString())));
   }

   Future<dynamic> postProducts(data,{id}) async {
    setProductList(ApiResponse.loading());
    await _productRepo.postProducts(data, id: id)
    .then((isPost) => setProductList(ApiResponse.completed(isPost)))
    .onError((error, stackTrace) => setProductList(ApiResponse.error(stackTrace.toString())));
   }
}