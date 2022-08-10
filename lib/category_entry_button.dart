import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow/category_entry_page.dart';
import 'package:flutter_flow/category_model.dart';

class CategoryEntryButton extends StatelessWidget {
  const CategoryEntryButton({
    Key? key,
    required this.categoryPrefName,
    required this.categoryPrefShortCode,
    required this.description,
    required this.title,
    required this.titleShortCode,
    required this.widget,
  }) : super(key: key);

  final TextEditingController categoryPrefName;
  final TextEditingController categoryPrefShortCode;
  final TextEditingController description;
  final TextEditingController title;
  final TextEditingController titleShortCode;
  final CategoryPage widget;

  @override
  Widget build(BuildContext context) {
    final isAddAction = widget.categoryAction == CategoryAction.add;
    return FloatingActionButton.extended(
      elevation: 2,
      onPressed: () {
        final categoryEntryMap = Category(
          categoryPrefName: categoryPrefName.text,
          categoryPrefShortCode: categoryPrefShortCode.text,
          description: description.text,
          organisation: null,
          parent: null,
          title: title.text,
          titleShortCode: titleShortCode.text,
        ).toMap();

        final id = widget.category.id;

        if (isAddAction) {
          FirebaseFirestore.instance
              .collection('category')
              .add(categoryEntryMap);
        } else {
          FirebaseFirestore.instance
              .collection('category')
              .doc(id)
              .update(categoryEntryMap);
        }

        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      },
      label: Text(isAddAction ? 'Submit' : 'Update'),
      icon: Icon(isAddAction ? Icons.book : Icons.bookmark_border),
    );
  }
}
