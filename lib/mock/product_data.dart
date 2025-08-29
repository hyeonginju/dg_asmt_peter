import 'package:dg_asmt_peter/widgets/product_card_carousel.dart';

// Product 데이터 모킹용 Map
const Map<String, Product> productData = {
  'Tents': Product(
    name: 'Alpine Tent Pro',
    price: '\$89.99',
    description:
        'Lightweight 2-person tent with excellent weather protection. Features quick setup design and reinforced corners for durability in harsh conditions.',
    tags: ['2 Person', 'Waterproof', 'Lightweight'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Sleeping bags': Product(
    name: 'Summit Sleep System',
    price: '\$129.99',
    description:
        'Premium down-filled sleeping bag rated for -10°C. Compressible design with water-resistant shell and comfortable mummy cut.',
    tags: ['-10°C Rated', 'Down Fill', 'Compact'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Backpacks': Product(
    name: 'Pacer Backpack 20L',
    price: '\$59.99',
    description:
        'Our bag features chest and hip straps, a pack away rain cover and convenient multiple pockets including a bottom compartment with a separate opening.',
    tags: ['20L Size', 'Solar Orange', '8 Pockets'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Hiking boots': Product(
    name: 'Trail Master Boots',
    price: '\$149.99',
    description:
        'Durable hiking boots with advanced grip technology. Waterproof construction with breathable membrane for all-day comfort.',
    tags: ['Waterproof', 'Grip Tech', 'All Terrain'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Camping gear': Product(
    name: 'Camp Essential Kit',
    price: '\$79.99',
    description:
        'Complete camping set including portable stove, cookware, and essential tools. Perfect for weekend adventures and extended trips.',
    tags: ['Complete Set', 'Portable', 'Multi-Tool'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Water bottles': Product(
    name: 'Hydro Flask Pro',
    price: '\$34.99',
    description:
        'Insulated water bottle keeps drinks cold for 24 hours or hot for 12 hours. Made from premium stainless steel with leak-proof cap.',
    tags: ['Insulated', '24H Cold', 'Leak Proof'],
    imagePath: 'assets/images/backpacks.png',
  ),
  'Flashlights': Product(
    name: 'Ultra Beam Light',
    price: '\$29.99',
    description:
        'High-intensity LED flashlight with multiple modes and USB charging. Water-resistant design perfect for outdoor adventures.',
    tags: ['LED Tech', 'USB Charge', 'Water Resistant'],
    imagePath: 'assets/images/backpacks.png',
  ),
};
