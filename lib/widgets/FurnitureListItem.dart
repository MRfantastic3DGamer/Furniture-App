import 'package:flutter/material.dart';
import 'package:furniture/screen/FurnitureScreen.dart';
import 'package:furniture/src/Furniture.dart';

import '../Data.dart';

class FurnitureListItem extends StatelessWidget {
  final Furniture furniture;
  final Color side;
  const FurnitureListItem({
    Key? key,
    required this.furniture,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 210,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 170,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(35)),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      color: side,
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.88,
                    padding:
                        const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          furniture.name,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          Data.typeNames[furniture.type] ?? " ",
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 252, 218, 168),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20))),
                    width: 100,
                    height: 40,
                    child: Center(
                      child: Text(
                        '${furniture.price}\$',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(150, 0, 20, 40),
              child: Hero(
                tag: "${furniture.name}_${furniture.type}",
                child: Center(child: furniture.imageMap.values.first)),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(_) => FurnitureScreen(furniture: furniture)));
      },
    );
  }
}