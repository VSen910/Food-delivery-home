import 'package:campus_haat/models/product.dart';
import 'package:campus_haat/providers/page_provider.dart';
import 'package:campus_haat/repositories/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final productsProvider = StateProvider<List<Product>>((ref) => []);

final getProductsProvider = FutureProvider<bool>((ref) async {
  try {
    final page = ref.read(pageProvider);
    final products = await ProductRepository.fetchProducts(page);
    ref.read(productsProvider.notifier).update((state) => [...state, ...products]);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
});
