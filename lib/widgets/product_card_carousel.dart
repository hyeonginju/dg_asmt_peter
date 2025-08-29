import 'package:dg_asmt_peter/mock/product_data.dart';
import 'package:dg_asmt_peter/theme/app_colors.dart';
import 'package:dg_asmt_peter/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_card_carousel.freezed.dart';
part 'product_card_carousel.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String price,
    required String description,
    required List<String> tags,
    @Default('assets/images/backpacks.png') String imagePath,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

class ProductCardCarousel extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(String)? onItemChange;
  const ProductCardCarousel({
    super.key,
    required this.items,
    this.selectedItem,
    this.onItemChange,
  });

  @override
  _ProductCardCarouselState createState() => _ProductCardCarouselState();
}

class _ProductCardCarouselState extends State<ProductCardCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startLoading(String item) {
    final newIndex = widget.items.indexOf(item);
    if (newIndex == -1) return;

    setState(() => _isLoading = true);

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        _currentIndex = newIndex;
        _isLoading = false;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_pageController.hasClients) return;
        _pageController.jumpToPage(newIndex);
        widget.onItemChange?.call(item);
      });
    });
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextCard() {
    if (_currentIndex < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void didUpdateWidget(covariant ProductCardCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != null &&
        widget.selectedItem != oldWidget.selectedItem &&
        widget.selectedItem != widget.items[_currentIndex]) {
      _startLoading(widget.selectedItem!);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (_isLoading) {
      return LoadingCard(
        width: screenWidth - 30,
        height: 250,
        color: Colors.grey.shade300,
      );
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: _previousCard,
            child: Opacity(
              opacity: _currentIndex > 0 ? 1.0 : 0.3,
              child: Image.asset(AppIcons.left, width: 7, height: 10),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 255,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final product = productData[item] ?? _getDefaultProduct(item);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ProductCard(
                    product: product,
                    screenWidth: screenWidth,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            onTap: _nextCard,
            child: Opacity(
              opacity: _currentIndex < widget.items.length - 1 ? 1.0 : 0.3,
              child: Image.asset(AppIcons.right, width: 7, height: 10),
            ),
          ),
        ),
      ],
    );
  }

  Product _getDefaultProduct(String itemName) {
    return Product(
      name: '$itemName dummy',
      price: '\$00.00',
      description: 'dummy data.',
      tags: const ['dummy', 'data', 'dummy'],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final double screenWidth;

  const ProductCard({
    super.key,
    required this.product,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColorLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(top: 10, right: 10, child: _buildFavoriteButton()),
          Positioned(
            right: -25,
            bottom: 0,
            child: Image.asset(product.imagePath, height: 185),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Text(
                    product.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                _buildTags(product.tags),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          // like feature
        },
        icon: const Icon(Icons.favorite_border, color: Colors.white, size: 20),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _buildTags(List<String> tags) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: tags.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, color: AppColors.mainColorDeep),
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const LoadingCard({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.mainColorLight,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
