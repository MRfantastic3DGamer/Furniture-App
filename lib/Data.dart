import 'package:flutter/material.dart';
import 'package:furniture/src/Furniture.dart';

class Data {
  static List<Furniture> allItems = [
    Furniture(
      imageMap: {
        Colors.white:
            Image.asset("lib/Assets/Images/Without BG/arm chair1.png"),
        const Color.fromARGB(255, 255, 213, 123):
            Image.asset("lib/Assets/Images/Without BG/arm chair1.1.png"),
      },
      name: "Classic",
      price: 130,
      description: 'This is a description',
      type: FurnitureType.Armchair,
    ),
    Furniture(
      imageMap: {
        Colors.white:
            Image.asset("lib/Assets/Images/Without BG/arm chair3.png"),
      },
      name: "Modern",
      price: 260,
      description: 'This is a description',
      type: FurnitureType.Armchair,
    ),
    Furniture(
      imageMap: {
        Colors.black: Image.asset("lib/Assets/Images/Without BG/chair1.png"),
      },
      name: "Bar stool",
      price: 30,
      description: 'This is a description',
      type: FurnitureType.Chair,
    ),
    Furniture(
      imageMap: {
        Colors.white: Image.asset("lib/Assets/Images/Without BG/chair2.png"),
      },
      name: "Princess",
      price: 30,
      description: 'This is a very very very very very very very very very very very very very very very very very long description',
      type: FurnitureType.Chair,
    ),
    Furniture(
      imageMap: {
        Colors.white:
            Image.asset("lib/Assets/Images/Without BG/park bench1.png"),
      },
      name: "Old Park",
      price: 100,
      description: 'This is a description',
      type: FurnitureType.ParkBench,
    ),
    Furniture(
      imageMap: {
        Colors.white:
            Image.asset("lib/Assets/Images/Without BG/park bench2.png"),
      },
      name: "Hard wood",
      price: 100,
      description: 'This is a description',
      type: FurnitureType.ParkBench,
    ),
    Furniture(
      imageMap: {
        Colors.white: Image.asset("lib/Assets/Images/Without BG/sofa1.png"),
      },
      name: "Classic",
      price: 200,
      description: 'This is a description',
      type: FurnitureType.Sofa,
    ),
    Furniture(
      imageMap: {
        Colors.white: Image.asset("lib/Assets/Images/Without BG/sofa2.png"),
      },
      name: "Porch",
      price: 200,
      description: 'This is a description',
      type: FurnitureType.Sofa,
    ),
  ];
  static List<Furniture> favorites = [];
  static List<Furniture> recommended = [];
  static Map<FurnitureType, String> typeNames = {
    FurnitureType.Sofa: "Sofa",
    FurnitureType.ParkBench: "Park Bench",
    FurnitureType.Armchair: "Armchair",
    FurnitureType.Chair: "Chair",
  };

  static Map<String, List<Furniture>> tagSearchedItems = {
    'All': allItems,
    'Sofa': allItems.where((f) => f.type == FurnitureType.Sofa).toList(),
    'Park bench':
        allItems.where((f) => f.type == FurnitureType.ParkBench).toList(),
    'Armchair':
        allItems.where((f) => f.type == FurnitureType.Armchair).toList(),
    'Chair': allItems.where((f) => f.type == FurnitureType.Chair).toList(),
  };

  static List<Furniture> search(String tag, String query) {
    return tagSearchedItems[tag]!.where((f) {
      return ('${f.name.toLowerCase()} ${Data.typeNames[f.type]!.toLowerCase()}' ).contains(query.toLowerCase());
    }).toList();
  }
}
