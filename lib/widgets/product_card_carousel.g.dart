// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_card_carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imagePath: json['imagePath'] as String? ?? 'assets/images/backpacks.png',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'tags': instance.tags,
      'imagePath': instance.imagePath,
    };
