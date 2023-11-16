import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meal_provider.dart';

enum Filter {
  glutenTree,
  lactoseTree,
  vegatarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenTree: false,
          Filter.lactoseTree: false,
          Filter.vegatarian: false,
          Filter.vegan: false,
        });
  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filterMealProvider = Provider((ref) {
  final meal = ref.watch(mealProvider);
  final activeFilter = ref.watch(filterProvider);
  return meal.where((element) {
    if (activeFilter[Filter.glutenTree]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactoseTree]! && !element.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegatarian]! && !element.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    return true;
  });
});
