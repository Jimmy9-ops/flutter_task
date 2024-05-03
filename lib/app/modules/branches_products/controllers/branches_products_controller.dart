import 'dart:convert';

import 'package:flutter_task/app/data/models/product.dart';
import 'package:get/get.dart';

import '../../../data/models/category.dart';
import 'package:http/http.dart' as http;


class BranchesProductsController extends GetxController {

 late  int selectedCategoryId = 20;
  List<Category> categories = [];

  Category? categoryIndex ;


 List<Product> products = [];

  void changeCategory (int categoryId){

    selectedCategoryId = categoryId;
    categoryIndex = categories.firstWhere((element) => element.id == categoryId);
    update();
  }


  Future fetchCategories() async {
    final response = await http.get(Uri.parse(
        'https://nottr.app/api/branch/20/categories'));
    if (response.statusCode == 200) {
      final categoryModel = CategoryResponse.fromJson(jsonDecode(response.body));


      for (var category  in categoryModel.data) {
       String title = category.titleAr;
       categories.add(category);
       print(title);

      }
            update();
    } else {
      throw Exception('Failed to load branches');
    }
  }



 Future loadProducts(int categoryId) async {
   final response = await http.get(Uri.parse(
       'https://nottr.app/api/branch/20/category/$categoryId/products?paginate=10&page=1'));
   if (response.statusCode == 200) {
     final productModel = ProductResponse.fromJson(jsonDecode(response.body));

     print(response.body);
     products.clear();

     for (var product  in productModel.data.products) {
       String title = product.sliderImage;
       products.add(product);
       print(title);

     }
     update();
   } else {
     throw Exception('Failed to load branches');
   }
 }


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
