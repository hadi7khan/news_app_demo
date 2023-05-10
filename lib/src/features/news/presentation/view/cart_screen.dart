import 'dart:developer';

import 'package:assignment/src/features/news/data/models/cart_model.dart';
import 'package:assignment/src/features/news/presentation/view_model/local_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _inventoryList = [];
  ValueNotifier<int?> totalPrice = ValueNotifier<int>(0);
  final LocalStorageRepository _localStorageRepository =
      LocalStorageRepository();
  Box<CartModel>? cartBox;

  @override
  void initState() {
    super.initState();

    _refreshItems();
  }

  // Get all items from the database
  _refreshItems() {
    cartBox = Hive.box('cartBox');
    final data = cartBox!.keys.map((key) {
      final value = cartBox!.get(key);
      return {
        'key': key,
        'author': value!.author,
        'title': value.title,
        'description': value.description
      };
    }).toList();
    log("this is data " + data.toString());
    log(data.toString());
    setState(() {
      _inventoryList = data.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'News Bookmark',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
       
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              
              Expanded(
                  child: _inventoryList.isEmpty
                      ? const Center(
                          child: Text(
                            'No Bookmarks',
                            style: TextStyle(fontSize: 30),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _inventoryList.length,
                          itemBuilder: (context, index) {
                            final currentItem = _inventoryList[index];
                            return Card(
                              color: Colors.grey.shade300,
                              elevation: 2.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // ClipRRect(
                                  //   child: CachedNetworkImage(
                                  //       height: 80,
                                  //       width: 80,
                                  //       imageUrl: currentItem['image']),
                                  // ),
                                  SizedBox(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: 'Name: ',
                                              style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade800,
                                                  fontSize: 16.0),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${currentItem['author']}\n',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          maxLines: 1,
                                          text: TextSpan(
                                              text: 'Title: ',
                                              style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade800,
                                                  fontSize: 16.0),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${currentItem['title']}\n',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                        //  Provider.of<ProductListViewProvider>(context, listen: false).deletefromcart(currentItem['key']);
                                      _localStorageRepository
                                          .removeCartItem(
                                              cartBox, currentItem['key'])
                                          .then((value) {
                                        _refreshItems();
                                        // Display a snackbar
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'An item has been deleted')));
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
             
            ],
          ),
        ),
      ),
    );
  }
}
