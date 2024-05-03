import 'package:get/get.dart';
import '../modules/branches_map/bindings/branches_map_binding.dart';
import '../modules/branches_map/views/branches_map_view.dart';
import '../modules/branches_products/bindings/branches_products_binding.dart';
import '../modules/branches_products/views/branches_products_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
part 'app_routes.dart';


class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MyHomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.BRANCHES_MAP,
      page: () => BranchesMapView(),
      binding: BranchesMapBinding(),
    ),
    GetPage(
      name: _Paths.BRANCHES_PRODUCTS,
      page: () => BranchesProductsView(),
      binding: BranchesProductsBinding(),
    ),
  ];
}
