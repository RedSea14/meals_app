import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key, required this.categoryModel, required this.onSelectCategory});
  CategoryModel categoryModel;
  final Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      highlightColor: Colors.purple.withOpacity(0.5),
      splashColor: Colors.pink.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.55),
              categoryModel.color.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          categoryModel.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
