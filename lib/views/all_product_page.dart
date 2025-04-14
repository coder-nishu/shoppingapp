import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_product_provider.dart';
import '../widgets/appbar_text.dart';
import '../widgets/prduct_card.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AllProductProvider>(
        context,
        listen: false,
      ).fetchAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'All Products'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body:
          provider.isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Colors.deepOrange),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: provider.allProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = provider.allProducts[index];
                  return ProductCard(product: product); // your own widget
                },
              ),
    );
  }
}
