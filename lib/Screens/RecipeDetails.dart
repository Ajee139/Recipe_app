import 'package:flutter/material.dart';
import '../model/meal_model.dart';

class RecipeDetails extends StatelessWidget {
  final Meal meal;

  const RecipeDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal ?? "Recipe Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  meal.strMealThumb ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.strMeal ?? "",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Category: ${meal.strCategory ?? 'Unknown'}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Instructions:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    meal.strInstructions ?? "No instructions available.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Ingredients:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  _buildIngredientsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsList() {
    List<String> ingredients = [];
    List<String> measures = [];

    // Collect all ingredients and measures
    if (meal.strIngredient1 != null && meal.strIngredient1!.isNotEmpty) {
      ingredients.add(meal.strIngredient1!);
      measures.add(meal.strMeasure1 ?? '');
    }
    if (meal.strIngredient2 != null && meal.strIngredient2!.isNotEmpty) {
      ingredients.add(meal.strIngredient2!);
      measures.add(meal.strMeasure2 ?? '');
    }
    if (meal.strIngredient3 != null && meal.strIngredient3!.isNotEmpty) {
      ingredients.add(meal.strIngredient3!);
      measures.add(meal.strMeasure3 ?? '');
    }
    if (meal.strIngredient4 != null && meal.strIngredient4!.isNotEmpty) {
      ingredients.add(meal.strIngredient4!);
      measures.add(meal.strMeasure4 ?? '');
    }
    if (meal.strIngredient5 != null && meal.strIngredient5!.isNotEmpty) {
      ingredients.add(meal.strIngredient5!);
      measures.add(meal.strMeasure5 ?? '');
    }
    if (meal.strIngredient6 != null && meal.strIngredient6!.isNotEmpty) {
      ingredients.add(meal.strIngredient6!);
      measures.add(meal.strMeasure6 ?? '');
    }
    if (meal.strIngredient7 != null && meal.strIngredient7!.isNotEmpty) {
      ingredients.add(meal.strIngredient7!);
      measures.add(meal.strMeasure7 ?? '');
    }
    if (meal.strIngredient8 != null && meal.strIngredient8!.isNotEmpty) {
      ingredients.add(meal.strIngredient8!);
      measures.add(meal.strMeasure8 ?? '');
    }
    if (meal.strIngredient9 != null && meal.strIngredient9!.isNotEmpty) {
      ingredients.add(meal.strIngredient9!);
      measures.add(meal.strMeasure9 ?? '');
    }
    if (meal.strIngredient10 != null && meal.strIngredient10!.isNotEmpty) {
      ingredients.add(meal.strIngredient10!);
      measures.add(meal.strMeasure10 ?? '');
    }
    if (meal.strIngredient11 != null && meal.strIngredient11!.isNotEmpty) {
      ingredients.add(meal.strIngredient11!);
      measures.add(meal.strMeasure11 ?? '');
    }
    if (meal.strIngredient12 != null && meal.strIngredient12!.isNotEmpty) {
      ingredients.add(meal.strIngredient12!);
      measures.add(meal.strMeasure12 ?? '');
    }
    if (meal.strIngredient13 != null && meal.strIngredient13!.isNotEmpty) {
      ingredients.add(meal.strIngredient13!);
      measures.add(meal.strMeasure13 ?? '');
    }
    if (meal.strIngredient14 != null && meal.strIngredient14!.isNotEmpty) {
      ingredients.add(meal.strIngredient14!);
      measures.add(meal.strMeasure14 ?? '');
    }
    if (meal.strIngredient15 != null && meal.strIngredient15!.isNotEmpty) {
      ingredients.add(meal.strIngredient15!);
      measures.add(meal.strMeasure15 ?? '');
    }
    if (meal.strIngredient16 != null && meal.strIngredient16!.isNotEmpty) {
      ingredients.add(meal.strIngredient16!);
      measures.add(meal.strMeasure16 ?? '');
    }
    if (meal.strIngredient17 != null && meal.strIngredient17!.isNotEmpty) {
      ingredients.add(meal.strIngredient17!);
      measures.add(meal.strMeasure17 ?? '');
    }
    if (meal.strIngredient18 != null && meal.strIngredient18!.isNotEmpty) {
      ingredients.add(meal.strIngredient18!);
      measures.add(meal.strMeasure18 ?? '');
    }
    if (meal.strIngredient19 != null && meal.strIngredient19!.isNotEmpty) {
      ingredients.add(meal.strIngredient19!);
      measures.add(meal.strMeasure19 ?? '');
    }
    if (meal.strIngredient20 != null && meal.strIngredient20!.isNotEmpty) {
      ingredients.add(meal.strIngredient20!);
      measures.add(meal.strMeasure20 ?? '');
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const Icon(Icons.circle, size: 8),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${measures[index]} ${ingredients[index]}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 