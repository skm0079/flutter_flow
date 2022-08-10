import 'package:flutter/material.dart';
import 'package:flutter_flow/category_entry_button.dart';
import 'package:flutter_flow/category_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
    required this.categoryAction,
    required this.category,
  }) : super(key: key);

  const CategoryPage.edit(
      {Key? key,
      this.categoryAction = CategoryAction.edit,
      required this.category})
      : super(key: key);

  const CategoryPage.add(
      {Key? key,
      this.categoryAction = CategoryAction.add,
      required this.category})
      : super(key: key);

  const CategoryPage.read(
      {Key? key,
      this.categoryAction = CategoryAction.read,
      required this.category})
      : super(key: key);

  final Category category;

  final CategoryAction categoryAction;
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late TextEditingController categoryPrefName;
  late TextEditingController categoryPrefShortCode;
  late TextEditingController description;
  late TextEditingController title;
  late TextEditingController titleShortCode;
  late bool isReadOnly;
  @override
  void initState() {
    categoryPrefName =
        TextEditingController(text: widget.category.categoryPrefName ?? '');
    description =
        TextEditingController(text: widget.category.description ?? '');
    title = TextEditingController(text: widget.category.title ?? '');
    titleShortCode =
        TextEditingController(text: widget.category.titleShortCode ?? '');
    categoryPrefShortCode = TextEditingController(
        text: widget.category.categoryPrefShortCode ?? '');

    isReadOnly = widget.categoryAction == CategoryAction.read;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                // categoryPrefName
                TextField(
                  readOnly: isReadOnly,
                  controller: categoryPrefName,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black87),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: isReadOnly ? '' : 'categoryPrefName',
                  ),
                ),
                // categoryPrefShortCode
                TextField(
                  readOnly: isReadOnly,
                  controller: categoryPrefShortCode,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'categoryPrefShortCode',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(height: 100),
                TextField(
                  readOnly: isReadOnly,
                  controller: description,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'description',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(height: 100),
                TextField(
                  readOnly: isReadOnly,
                  controller: title,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'TITLE',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(height: 100),
                TextField(
                  readOnly: isReadOnly,
                  controller: titleShortCode,
                  maxLines: null,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black87, height: 1.7),
                  decoration: InputDecoration.collapsed(
                    hintText: 'titleShortCode',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: isReadOnly
          ? const SizedBox()
          : CategoryEntryButton(
              categoryPrefShortCode: categoryPrefShortCode,
              description: description,
              title: title,
              categoryPrefName: categoryPrefName,
              titleShortCode: titleShortCode,
              widget: widget,
            ),
    );
  }

  @override
  void dispose() {
    categoryPrefName.dispose();
    categoryPrefShortCode.dispose();
    description.dispose();
    title.dispose();
    titleShortCode.dispose();
    super.dispose();
  }
}

enum CategoryAction { edit, add, read }
