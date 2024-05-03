import 'package:get/get.dart';

import '../controllers/branches_map_controller.dart';

class BranchesMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BranchesMapController>(
      () => BranchesMapController(),
    );
  }
}
