import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String? id;
  final String? categoryPrefName;
  final String? catgeoryPrefShortCode;
  final String? description;
  final DocumentReference? organisation;
  final DocumentReference? parent;
  final String? title;
  final String? titleShortCode;

  Category(
      {required this.id,
      required this.categoryPrefName,
      required this.catgeoryPrefShortCode,
      required this.description,
      required this.organisation,
      required this.parent,
      required this.title,
      required this.titleShortCode});

  Map<String, dynamic> toMap() {
    return {
      'categoryPrefName': categoryPrefName,
      'catgeoryPrefShortCode': catgeoryPrefShortCode,
      'description': description,
      'organisation': organisation,
      'parent': parent,
      'title': title,
      'titleShortCode': titleShortCode,
    };
  }

  factory Category.fromDoc(QueryDocumentSnapshot doc) {
    return Category(
      categoryPrefName: (doc.data() as dynamic)['categoryPrefName'],
      catgeoryPrefShortCode: (doc.data() as dynamic)['catgeoryPrefShortCode'],
      description: (doc.data() as dynamic)['description'],
      organisation: (doc.data() as dynamic)['organisation'],
      parent: (doc.data() as dynamic)['parent'],
      title: (doc.data() as dynamic)['title'],
      titleShortCode: (doc.data() as dynamic)['titleShortCode'],
      id: doc.id,
    );
  }
}
