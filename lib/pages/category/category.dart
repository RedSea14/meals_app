import 'package:flutter/material.dart';
import 'package:meals_app/data/my_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/category/widgets/category_item.dart';
import 'package:meals_app/pages/meal/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.avaiableMeals});
  final List<Meal> avaiableMeals;
  void _selectCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredMeals = avaiableMeals
        .where((meal) => meal.categories.contains(categoryModel.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: categoryModel.title,
            meals: filteredMeals,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: availableCategories
            .map((CategoryModel categoryModel) => CategoryItem(
                  categoryModel: categoryModel,
                  onSelectCategory: () =>
                      _selectCategory(context, categoryModel),
                ))
            .toList(),
      ),
    );
  }
}
