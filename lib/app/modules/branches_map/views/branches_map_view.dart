import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/branches_map_controller.dart';

class BranchesMapView extends GetView<BranchesMapController> {
   BranchesMapView({Key? key}) : super(key: key);

  final c = Get.find<BranchesMapController>();


  static final CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(20.256565, 30.556654654),
    zoom: 3.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Stack(children: [

        GetBuilder<BranchesMapController>(builder: (_)  =>  GoogleMap(
    padding: const EdgeInsets.only(bottom: 5.0, top: 25.0),
    mapType: MapType.normal,
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    zoomGesturesEnabled: true,
    zoomControlsEnabled: true, //true
    initialCameraPosition:_kGooglePlex,
    markers: c.markersSet,
    onMapCreated: (GoogleMapController controller) {
   c.controllerGoogleMap.complete(controller);
   c.newGoogleMapController = controller;




    //c.locatePosition();
    },
    ),),
   ]
        ),
    );

  }
}
