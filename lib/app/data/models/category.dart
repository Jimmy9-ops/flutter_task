class CategoryResponse {
  final bool status;
  final String msg;
  final List<Category> data;

  CategoryResponse({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Category> categories =
    dataList.map((data) => Category.fromJson(data)).toList();

    return CategoryResponse(
      status: json['status'],
      msg: json['msg'],
      data: categories,
    );
  }
}

class Category {
  final int id;
  final String titleEn;
  final String titleAr;
  final bool isActive;
  final String image;
  final int order;
  final String createdAt;
  final String? updatedAt;
  final int companyId;
  final int refId;

  Category({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.isActive,
    required this.image,
    required this.order,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
    required this.refId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      titleEn: json['title']['en'],
      titleAr: json['title']['ar'],
      isActive: json['is_active'] == 1,
      image: json['image'],
      order: json['order'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      companyId: json['company_id'],
      refId: json['ref_id'],
    );
  }
}