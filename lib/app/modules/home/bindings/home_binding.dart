import 'package:flutter_task/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyHomePage>(
      () => MyHomePage(),
    );
  }
}
