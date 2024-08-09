import '../data/data.dart';
import '../model/product_model.dart';

class ProductRepository {
  Future<List<Product>> getListProduct() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Product> products = List<Product>.from(
      data.map(
        (item) => Product.fromJson(item),
      ),
    );
    return products;
  }
}
