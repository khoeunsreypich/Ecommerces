
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
import 'package:ecommerce/Models/Request/category.dart';
import 'package:ecommerce/Repository/product_repo.dart';
import 'package:flutter/cupertino.dart';

import '../Models/Request/product.dart';

class CategoryViewModel extends ChangeNotifier{
  final _categoryRepo = ProductRepository();
  ApiResponse<Categories> response = ApiResponse.loading();

  setProductList(response) {
    this.response = response;
    notifyListeners();
  }
  Future<dynamic> getAllCategory() async {
    await _categoryRepo.getAllCategories()
        .then((product) => setProductList(ApiResponse.completed(product)))
        .onError((error, stackTrace)
    => setProductList(ApiResponse.error(stackTrace.toString())));
  }

}