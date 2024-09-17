import 'package:campus_haat/providers/list_end_provider.dart';
import 'package:campus_haat/utils/food_card.dart';
import 'package:campus_haat/providers/products_provider.dart';
import 'package:campus_haat/providers/page_provider.dart';
import 'package:campus_haat/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(fetchNewProducts);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> fetchNewProducts() async {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      ref.read(pageProvider.notifier).update((state) => state + 1);
      int page = ref.read(pageProvider);
      final products = await ProductRepository.fetchProducts(page);
      if (products.isNotEmpty) {
        ref
            .read(productsProvider.notifier)
            .update((state) => [...state, ...products]);
      } else {
        ref.read(listEndProvider.notifier).state = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var getProducts = ref.watch(getProductsProvider);
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food delivery',
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(pageProvider.notifier).state = 0;
          ref.read(productsProvider.notifier).state = [];
          ref.read(listEndProvider.notifier).state = false;
          getProducts = ref.refresh(getProductsProvider);
        },
        child: getProducts.when(
          data: (data) {
            if (data) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: products.length + 1,
                itemBuilder: (context, index) {
                  if (index < products.length) {
                    print(index);
                    final product = products[index];
                    return FoodCard(product: product);
                  } else {
                    if (ref.watch(listEndProvider)) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0.r),
                          child: Text(
                            'No more items to display',
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0.r),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }
                },
              );
            } else {
              return const Text('Something went wrong');
            }
          },
          error: (error, st) {
            print(error);
            print(st);
            return const Text('jhol');
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
