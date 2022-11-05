import 'package:flutter/material.dart';

class Furniture {
  late Map<Color, Image> imageMap;
  late String name;
  late FurnitureType type;
  late int price;
  late String description;

  Furniture({
    required this.imageMap,
    required this.name,
    required this.type,
    required this.price,
    required this.description,
  });
}

enum FurnitureType {
  All,
  Armchair,
  TubChair,
  Chair,
  ParkBench,
  Sofa,
}
