import 'dart:math';

import 'package:flutter/material.dart';

import '../Data.dart';
import '../src/Furniture.dart';
import '../widgets/FurnitureListItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String query = "";
final TextEditingController searchController =
    TextEditingController(text: query);
String currentTag = 'All';
List<Furniture> items = Data.allItems;
FocusNode focusNode = FocusNode();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void changeTag(String tag) {
      setState(() {
        currentTag = tag;
        items = Data.tagSearchedItems[tag]!;
      });
    }

    void searchItem() {
      final suggestions = Data.search(currentTag, query);

      setState(() => items = suggestions);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Search bar
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    height: 65,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 121, 171, 236),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      controller: searchController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white, size: 30),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onSubmitted: (value) {
                        query = value;
                        searchItem();
                        focusNode.unfocus();
                      },
                      onChanged: (value) {
                        query = value;
                        searchItem();
                      },
                    ),
                  ),
                ),
              ),
              // Tags
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: Data.tagSearchedItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          changeTag(
                            Data.tagSearchedItems.keys.toList()[index],
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  Data.tagSearchedItems.keys.toList()[index] ==
                                          currentTag
                                      ? const Color.fromARGB(255, 121, 171, 236)
                                      : const Color.fromARGB(0, 255, 255, 255),
                            ),
                            child: Text(
                              Data.tagSearchedItems.keys.toList()[index],
                              style: const TextStyle(color: Colors.white),
                            )),
                      );
                    },
                  ),
                ),
              ),
              // Furniture List
              Stack(
                children: [
                  // Background Art
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    height: max(items.length * 230, 3 * 230),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(90),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SizedBox(
                        height: max(items.length * 230 + 100, 3 * 230 + 100),
                        child: ListView.builder(
                          primary: false,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final f = items[index];
                            return FurnitureListItem(
                              furniture: f,
                              side: index % 2 == 0 ? Colors.cyan : Colors.amber,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
