import 'package:assignment/src/features/news/data/models/cart_model.dart';
import 'package:hive/hive.dart';

abstract class BaseLocalStorageRepository {
Future<Box> openBox();
List<CartModel> getCartList(Box box);
Future<void> addCartItem(Box<CartModel> box, CartModel cart);
Future<void> removeCartItem(Box<CartModel> box, int id);
Future<void> clearCart(Box<CartModel> box);
}