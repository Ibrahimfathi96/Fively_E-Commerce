import 'package:fively_ecommerce/services/firestore_services.dart';

import '../models/product.dart';

abstract class Database{
  Stream<List <Product>> productsStream();
}

class FireStoreDatabase implements Database{
  final _service = FireStoreServices.instance;
  @override
  Stream<List<Product>> productsStream() => _service.collectionsStream(
    path: 'products/',
    builder: (data, documentId) => Product.fromJson(data!, documentId),
  );
}