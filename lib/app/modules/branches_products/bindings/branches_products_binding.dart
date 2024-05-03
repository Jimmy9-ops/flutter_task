import 'package:get/get.dart';

import '../controllers/branches_products_controller.dart';

class BranchesProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchesProductsController>(
      () => BranchesProductsController(),
    );
  }
}
