import 'dart:developer';

import 'package:assignment/src/features/news/data/models/cart_model.dart';
import 'package:assignment/src/features/news/presentation/view_model/base_local_storage.dart';
import 'package:hive/hive.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {

  String boxName = 'cartBox';

  @override
  Future<Box<CartModel>> openBox() async{
    Box<CartModel> box = await Hive.openBox<CartModel>(boxName);
    log(box.toString());
    return box;
  }

  @override
  List<CartModel> getCartList(Box box) {
    log(box.toString());
    return box.values.toList() as List<CartModel>;
  }

  @override
  Future<void> addCartItem(Box<CartModel>? box, CartModel cart) async{
    log(box.toString());
    log(cart.toString());
    await box!.put(cart.id, cart);
  }

  @override
  Future<void> removeCartItem(Box<CartModel>? box, int id) async{
    await box!.delete(id);
    log("deleted item");
  }

  @override
  Future<void> clearCart(Box<CartModel>? box) async{
    await box!.clear();
  }
}