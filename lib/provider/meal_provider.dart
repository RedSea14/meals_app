import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/my_data.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
