class BranchModel {
  final bool status;
  final String msg;
  final List<BranchData> data;

  BranchModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    List<BranchData> dataList = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        dataList.add(BranchData.fromJson(v));
      });
    }
    return BranchModel(
      status: json['status'],
      msg: json['msg'],
      data: dataList,
    );
  }
}

class BranchData {
  final int id;
  final Title title;
  final String phone;
  final int isActive;
  final String image;
  final String lat;
  final String long;
  //final String? morningTimeFrom;
  final String? morningTimeTo;
 // final String eveningTimeFrom;
//  final String eveningTimeTo;
  final String? busyAt;
  final String busyHours;
  final int? popupCategoryId;
  final int popupProductId;
  final String popupPhoto;
  final int showPopup;
  final String createdAt;
  final String updatedAt;
  final String instagram;
  final String twitter;
  final Address address;
  final int minTotalOrder;
  final String? deliveryTimeFrom;
  final String? deliveryTimeTo;
  final String? code;
  final String taxNumber;
  final int companyId;
  final String? qrImage;
  final int isWaitingList;
  final int waitingListNotifyCount;
  final int refId;
  final String statusEn;
  final String statusAr;
  final int statusNo;
  final double distance;
  final int inFavourite;
 // final double rate;
  final String? popupCategoryTitle;
  final List<BranchOrderMethod> branchOrderMethod;
  final Company company;

  BranchData({
    required this.id,
    required this.title,
    required this.phone,
    required this.isActive,
    required this.image,
    required this.lat,
    required this.long,
   // required this.eveningTimeFrom,
   // required this.eveningTimeTo,
    required this.busyHours,
    required this.popupProductId,
    required this.popupPhoto,
    required this.showPopup,
    required this.createdAt,
    required this.updatedAt,
    required this.instagram,
    required this.twitter,
    required this.address,
    required this.minTotalOrder,
    required this.taxNumber,
    required this.companyId,
    required this.isWaitingList,
    required this.waitingListNotifyCount,
    required this.refId,
    required this.statusEn,
    required this.statusAr,
    required this.statusNo,
    required this.distance,
    required this.inFavourite,
   // required this.rate,
    required this.branchOrderMethod,
    required this.company,
    //this.morningTimeFrom,
    this.morningTimeTo,
    this.busyAt,
    this.popupCategoryId,
    this.deliveryTimeFrom,
    this.deliveryTimeTo,
    this.code,
    this.qrImage,
    this.popupCategoryTitle,
  });

  factory BranchData.fromJson(Map<String, dynamic> json) {
    return BranchData(
      id: json['id'],
      title: Title.fromJson(json['title']),
      phone: json['phone'],
      isActive: json['is_active'],
      image: json['image'],
      lat: json['lat'],
      long: json['long'],
    //  eveningTimeFrom: json['evening_time_from'],
    //  eveningTimeTo: json['evening_time_to'],
      busyHours: json['busy_hours'],
      popupProductId: json['popup_product_id'],
      popupPhoto: json['popup_photo'],
      showPopup: json['show_popup'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      instagram: json['instagram'],
      twitter: json['twitter'],
      address: Address.fromJson(json['address']),
      minTotalOrder: json['min_total_order'],
      taxNumber: json['tax_number'],
      companyId: json['company_id'],
      isWaitingList: json['is_waiting_list'],
      waitingListNotifyCount: json['waiting_list_notify_count'],
      refId: json['ref_id'],
      statusEn: json['status_en'],
      statusAr: json['status_ar'],
      statusNo: json['status_no'],
      distance: json['distance'],
      inFavourite: json['in_favourite'],
     // rate: json['rate'] as double,
      branchOrderMethod: (json['branch_order_method'] as List)
          .map((e) => BranchOrderMethod.fromJson(e))
          .toList(),
      company: Company.fromJson(json['company']),
    );
  }
}

class Title {
  final String en;
  final String ar;

  Title({
    required this.en,
    required this.ar,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class Address {
  final String en;
  final String ar;

  Address({
    required this.en,
    required this.ar,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class BranchOrderMethod {
  final int id;
  final Title title;
  final int isActive;
  final String image;
  final String createdAt;
  final BranchOrderMethodPivot pivot;

  BranchOrderMethod({
    required this.id,
    required this.title,
    required this.isActive,
    required this.image,
    required this.createdAt,
    required this.pivot,
  });

  factory BranchOrderMethod.fromJson(Map<String, dynamic> json) {
    return BranchOrderMethod(
      id: json['id'],
      title: Title.fromJson(json['title']),
      isActive: json['is_active'],
      image: json['image'],
      createdAt: json['created_at'],
      pivot: BranchOrderMethodPivot.fromJson(json['pivot']),
    );
  }
}

class BranchOrderMethodPivot {
  final int branchId;
  final int orderMethodId;

  BranchOrderMethodPivot({
    required this.branchId,
    required this.orderMethodId,
  });

  factory BranchOrderMethodPivot.fromJson(Map<String, dynamic> json) {
    return BranchOrderMethodPivot(
      branchId: json['branch_id'],
      orderMethodId: json['order_method_id'],
    );
  }
}

class Company {
  final int id;
  final Title title;
  final String phone;
  final int isActive;
  final String image;
  final String createdAt;
  final String updatedAt;
  final About about;
  final TermsConditions termsConditions;
  final String email;

  Company({
    required this.id,
    required this.title,
    required this.phone,
    required this.isActive,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.about,
    required this.termsConditions,
    required this.email,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      title: Title.fromJson(json['title']),
      phone: json['phone'],
      isActive: json['is_active'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      about: About.fromJson(json['about']),
      termsConditions: TermsConditions.fromJson(json['terms_conditions']),
      email: json['email'],
    );
  }
}

class About {
  final String en;
  final String ar;

  About({
    required this.en,
    required this.ar,
  });

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class TermsConditions {
  final String en;
  final String ar;

  TermsConditions({
    required this.en,
    required this.ar,
  });

  factory TermsConditions.fromJson(Map<String, dynamic> json) {
    return TermsConditions(
      en: json['en'],
      ar: json['ar'],
    );
  }
}