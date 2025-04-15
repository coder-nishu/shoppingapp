import 'package:flutter/material.dart';
import '../model/product_model.dart';

import '../routers/app_routers.dart';
import '../widgets/appbar.dart';
import '../widgets/carousel.dart';
import '../widgets/category.dart';
import '../widgets/heading.dart';
import '../widgets/prduct_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Product> demoProducts = [
    Product(
      id: '1001',
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
      id: '1002',
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
      appBar: HAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HHeading(title: 'Flash Sales', isSeeAll: false,icon: Icons.flash_on,),

              HCarousel(),
              HHeading(title: 'Categories',icon: Icons.category, isSeeAll: false),
              const HCategory(),
              HHeading(
                title: 'Best Sales',
                icon: Icons.favorite,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.allProducts);
                },
              ),
              GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: demoProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 260,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = demoProducts[index];
                      return InkWell(
                        child: ProductCard(product: product),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productDetail,
                            arguments: product,
                          );
                        },
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
