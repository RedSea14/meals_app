// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/pages/meal/widget/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
    required this.onSelectMeal,
  }) : super(key: key);
  final Meal meal;
  String get getcomplexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get getaffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  final void Function(BuildContext context, Meal meal) onSelectMeal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.hardEdge,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Hero(
            tag: meal.id,
            child: Stack(
              children: [
                // FadeInImage.memoryNetwork(
                //   placeholder: kTransparentImage,
                //   image: meal.imageUrl,
                //   fit: BoxFit.cover,
                // ),
                Image.asset(
                  'assets/images/myimg.jpg',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MealItemTrait(
                                iconData: Icons.schedule,
                                label: '${meal.duration.toString()}min'),
                            const SizedBox(
                              width: 10,
                            ),
                            MealItemTrait(
                                iconData: Icons.time_to_leave,
                                label: getcomplexityText),
                            const SizedBox(
                              width: 10,
                            ),
                            MealItemTrait(
                                iconData: Icons.price_change,
                                label: getaffordabilityText),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
