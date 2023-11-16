import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/pages/category/category.dart';
import 'package:meals_app/pages/filter/filter.dart';
import 'package:meals_app/pages/main_drawer.dart';
import 'package:meals_app/pages/meal/meal.dart';
import 'package:meals_app/provider/favorite_provider.dart';
import 'package:meals_app/provider/filter_provider.dart';
import 'package:meals_app/provider/meal_provider.dart';

const kInitialFilter = {
  Filter.glutenTree: false,
  Filter.lactoseTree: false,
  Filter.vegatarian: false,
  Filter.vegan: false,
};

class TabNavigation extends ConsumerStatefulWidget {
  const TabNavigation({super.key});

  @override
  ConsumerState<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends ConsumerState<TabNavigation> {
  int _selectedIndex = 0;

  void _setScreen(String identifer) async {
    Navigator.of(context).pop();
    if (identifer == "Filters") {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => const FilterSrceen(),
      ));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final avaiableMeals = ref.watch(filterMealProvider);
    Widget activePage = CategoryScreen(
      avaiableMeals: avaiableMeals.toList(),
    );
    String activePageTitle = "Categories";
    if (_selectedIndex == 1) {
      final favoriteMeal = ref.watch(favoritemealProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = "Your Favorite";
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
