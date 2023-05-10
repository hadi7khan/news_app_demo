import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;

  CartModel({
    this.id,
    this.author,
    this.title,
    this.description,
  });

  CartModel.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
      author = data['author'],
        title = data['title'],
        description = data['description'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
    };
  }
}
