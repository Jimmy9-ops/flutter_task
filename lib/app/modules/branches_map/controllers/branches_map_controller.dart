import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/mapBranches.dart';
import 'package:http/http.dart' as http;

import '../views/branch_dialog.dart';


class BranchesMapController extends GetxController {
  //TODO: Implement BranchesMapController


  Completer<GoogleMapController> controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;

 // late Position currentPosition;

   Set<Marker> markersSet = {};


  BitmapDescriptor? nearByIcon;

//  void locatePosition() async {
//    Position position = await Geolocator.getCurrentPosition(
//        desiredAccuracy: LocationAccuracy.high);
//    currentPosition = position;
//    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
//
//    CameraPosition cameraPosition =
//    new CameraPosition(target: latLatPosition, zoom: 14);
//    newGoogleMapController
//        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//
//    // initGeoFireListner();
//    collectLocations();
//    //  update();
//  }


  void createIconMaker() {
    if (nearByIcon == null) {
      ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(Get.context!, size: Size(2, 2));
      BitmapDescriptor.fromAssetImage(imageConfiguration, 'assets/house.png')
          .then((value) {
        nearByIcon = value;
      });
    }
  }


  RxSet<Marker> tMarkers = RxSet<Marker>();

  Future fetchBranches() async {
    final response = await http.get(Uri.parse(
        'https://nottr.app/api/branches?lat=20.256565&long=30.556654654&company_id=3'));
    if (response.statusCode == 200) {
      final branchModel = BranchModel.fromJson(jsonDecode(response.body));
          RxSet<Marker> tMarkers = RxSet<Marker>();

      for (var branch in branchModel.data) {
        double lat = double.parse(branch.lat);
        double long = double.parse(branch.long);
        LatLng pos = LatLng(lat, long);


        Marker marker = Marker(
         onTap: () async {
         showDialog(
             context: Get.context!,
             builder: (context) => BranchDialog(phone: branch.phone, address: branch.address.ar,
               distance: branch.distance, image: branch.image, isActive: branch.isActive, title: branch.title.ar,statusAr: branch.statusAr,

             ));
        },
         markerId: MarkerId(branch.id.toString()),
         position: LatLng(pos.latitude, pos.longitude),
         icon: nearByIcon as BitmapDescriptor,);
        tMarkers.add(marker);

        markersSet = tMarkers;
       // markersSet.refresh();
                     update();
      }

  //

    } else {
      throw Exception('Failed to load branches');
    }
  }


  @override
  void onInit() {
    createIconMaker();
    fetchBranches();
   // locatePosition();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    createIconMaker();
  //  locatePosition();
  }
}
