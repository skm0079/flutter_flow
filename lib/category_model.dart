import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String? id;
  final String? categoryPrefName;
  final String? categoryPrefShortCode;
  final String? description;
  final DocumentReference? organisation;
  final DocumentReference? parent;
  final String? title;
  final String? titleShortCode;

  Category(
      {this.id,
      required this.categoryPrefName,
      required this.categoryPrefShortCode,
      required this.description,
      required this.organisation,
      required this.parent,
      required this.title,
      required this.titleShortCode});

// Converts Category object to toMap object get a map object to send to firebase

  Map<String, dynamic> toMap() {
    return {
      'categoryPrefName': categoryPrefName,
      'categoryPrefShortCode': categoryPrefShortCode,
      'description': description,
      'organisation': organisation,
      'parent': parent,
      'title': title,
      'titleShortCode': titleShortCode,
    };
  }

/*
factory : factory Constructor returns an instance of a class
fromDoc : To use the returned map object to class-object data
 */

  factory Category.fromDoc(QueryDocumentSnapshot doc) {
    return Category(
      categoryPrefName: (doc.data() as dynamic)['categoryPrefName'],
      categoryPrefShortCode: (doc.data() as dynamic)['categoryPrefShortCode'],
      description: (doc.data() as dynamic)['description'],
      organisation: (doc.data() as dynamic)['organisation'],
      parent: (doc.data() as dynamic)['parent'],
      title: (doc.data() as dynamic)['title'],
      titleShortCode: (doc.data() as dynamic)['titleShortCode'],
      id: doc.id,
    );
  }
}
