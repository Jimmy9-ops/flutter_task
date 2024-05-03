class ProductResponse {
  final bool status;
  final String msg;
  final ProductData data;

  ProductResponse({required this.status, required this.msg, required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'],
      msg: json['msg'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  final int currentPage;
  final List<Product> products;

  ProductData({required this.currentPage, required this.products});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    List<Product> productList = [];
    if (json['data'] != null) {
      var productListJson = json['data'] as List;
      productList = productListJson.map((productJson) => Product.fromJson(productJson)).toList();
    }

    return ProductData(
      currentPage: json['current_page'],
      products: productList,
    );
  }
}

class Product {
  final int id;
  final Title title;
  final Description description;
  final String calories;
  final double price;
  final double newPrice;
  final bool isActive;
  final bool isSlider;
  final bool isMorning;
  final bool isEvening;
  final int indexNum;
  final bool recommend;
  final bool denyCoupon;
  final int categoryId;
  final String createdAt;
 // final String updatedAt;
  final String sliderImage;
  final int maxQuantity;
  final List<ProductImage> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.calories,
    required this.price,
    required this.newPrice,
    required this.isActive,
    required this.isSlider,
    required this.isMorning,
    required this.isEvening,
    required this.indexNum,
    required this.recommend,
    required this.denyCoupon,
    required this.categoryId,
    required this.createdAt,
  //  required this.updatedAt,
    required this.sliderImage,
    required this.maxQuantity,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<ProductImage> imagesList = [];
    if (json['images'] != null) {
      var imagesJson = json['images'] as List;
      imagesList = imagesJson.map((imageJson) => ProductImage.fromJson(imageJson)).toList();
    }

    return Product(
      id: json['id'],
      title: Title.fromJson(json['title']),
      description: Description.fromJson(json['description']),
      calories: json['calories'],
      price: json['price'].toDouble(),
      newPrice: json['new_price'].toDouble(),
      isActive: json['is_active'] == 1,
      isSlider: json['is_slider'] == 1,
      isMorning: json['is_morning'] == 1,
      isEvening: json['is_evening'] == 1,
      indexNum: json['indexnum'],
      recommend: json['recommend'] == 1,
      denyCoupon: json['deny_coupon'] == 1,
      categoryId: json['category_id'],
      createdAt: json['created_at'],
     // updatedAt: json['updated_at'],
      sliderImage: json['slider_image'] ?? '',
      maxQuantity: json['max_quantity'],
      images: imagesList,
    );
  }
}

class Title {
  final String en;
  final String ar;

  Title({required this.en, required this.ar});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class Description {
  final String en;
  final String ar;

  Description({required this.en, required this.ar});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      en: json['en'],
      ar: json['ar'],
    );
  }
}

class ProductImage {
  final int id;
  final String image;

  ProductImage({required this.id, required this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      image: json['image'],
    );
  }
}
