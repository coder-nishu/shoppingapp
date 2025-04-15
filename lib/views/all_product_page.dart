import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../widgets/appbar_text.dart';
import '../widgets/prduct_card.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  final List<Product> demoProducts = [
    Product(
      id: '2001',
      name: 'FeatherFuel Bird Food',
      description: 'A healthy blend for small birds.',
      price: 5,
      category: 'bird food',
      imageUrl: [
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/bird1.png?raw=true',
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/bird2.png?raw=true',
      ],
      rating: 4.4,
      isFavorite: true,
    ),
    Product(
      id: '2002',
      name: 'AquaBites Fish Food',
      description: 'Pellets for tropical fish.',
      price: 4,
      category: 'fish food',
      imageUrl: [
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/fish1.png?raw=true',
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/fish2.png?raw=true',
      ],
      rating: 4.3,
      isFavorite: true,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'All Products'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body:

              GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: demoProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = demoProducts[index];
                  return ProductCard(product: product); // your own widget
                },
              ),
    );
  }
}
