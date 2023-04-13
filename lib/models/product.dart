import 'package:fively_ecommerce/utilities/app_assets.dart';

class Product {
  final String id;
  final String title;
  final String upperTitle;
  final double price;
  final String imageUrl;
  final int discountValue;
  final double? rating;
  final String category;

  Product(
      {required this.id,
      required this.title,
      required this.upperTitle,
      required this.price,
      required this.imageUrl,
      this.discountValue = 0,
      this.rating,
      this.category = 'Others'});

  factory Product.fromJson(Map<String, dynamic> json,String documentId) {
    return Product(
      id: documentId,
      title: json["title"],
      upperTitle: json["upperTitle"],
      price: double.parse(json["price"]),
      imageUrl: json["imageUrl"],
      discountValue: int.parse(json["discountValue"]),
      rating: double.parse(json["rating"]),
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "upperTitle": this.upperTitle,
      "price": this.price,
      "imageUrl": this.imageUrl,
      "discountValue": this.discountValue,
      "rating": this.rating,
      "category": this.category,
    };
  }
}
List<Product> dummyProducts = [
  Product(id: '1', title: 'Evening Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item1,discountValue: 20),
  Product(id: '2', title: 'Sport Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item2,discountValue: 20),
  Product(id: '4', title: 'Evening Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item4,discountValue: 20),
  Product(id: '5', title: 'Sport Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item5,discountValue: 20),
  Product(id: '6', title: 'Evening Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item6,discountValue: 20),
  Product(id: '10', title: 'Sport Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item1,discountValue: 20),
  Product(id: '11', title: 'Evening Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item2,discountValue: 20),
  Product(id: '4', title: 'Sport Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item4,discountValue: 20),
  Product(id: '5', title: 'Evening Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item5,discountValue: 20),
  Product(id: '6', title: 'Sport Dress', upperTitle: 'Dorothy Perkins', price: 300, imageUrl: AppAssets.item6,discountValue: 20),
];