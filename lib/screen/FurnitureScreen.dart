import 'package:flutter/material.dart';
import 'package:furniture/src/Furniture.dart';

import '../Data.dart';

Color? _currentColor;

class FurnitureScreen extends StatefulWidget {
  late Furniture furniture;
  FurnitureScreen({super.key, required this.furniture});

  @override
  State<FurnitureScreen> createState() => _FurnitureScreenState();
}

class _FurnitureScreenState extends State<FurnitureScreen> {
  Color get currentColor =>
      _currentColor ?? widget.furniture.imageMap.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back_rounded),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('BACK',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: IconButton(
                            onPressed: () {
                              if (!Data.favorites.contains(widget.furniture)) {
                                Data.favorites.add(widget.furniture);
                              }
                            },
                            icon: const Icon(Icons.add_shopping_cart_outlined,
                                size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Hero(
                      tag: "${widget.furniture.name}_${widget.furniture.type}",
                      child: widget.furniture.imageMap[currentColor] as Image,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...widget.furniture.imageMap.keys.map(
                        (c) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(10, 10),
                            shape: const CircleBorder(),
                            backgroundColor: (c == currentColor)
                                ? const Color.fromARGB(255, 193, 193, 193)
                                : const Color.fromARGB(0, 0, 0, 0),
                          ),
                          onPressed: () {
                            setState(() {
                              _currentColor = c;
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: c,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                      '${widget.furniture.name} ${Data.typeNames[widget.furniture.type]}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Text('\$${widget.furniture.price}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Text(
                      widget.furniture.description,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.87,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  children: [
                    Container(),
                    Container(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
