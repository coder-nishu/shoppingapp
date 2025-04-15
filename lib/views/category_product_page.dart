import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/product_model.dart';
import '../routers/app_routers.dart';
import '../widgets/prduct_card.dart';

class CategoryProductsPage extends StatelessWidget {
  final String category;
  CategoryProductsPage({super.key, required this.category});
  final List<Product> demoProducts = [
    Product(
      id: '3001',
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
      id: '3002',
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
      appBar: AppBar(title: Text('$category Products')),
      body:
           Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: demoProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 16,
                mainAxisExtent: 260,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetail,
                      arguments: demoProducts[index],
                    );
                  },
                  child: ProductCard(product: demoProducts[index]),
                );
              },
            ),
      ),
    );
  }
}
