import 'package:flutter/material.dart';
import 'package:recipe/api/api_services.dart';
import 'package:recipe/model/meal_model.dart' show Meal;
import '../model/meal_model.dart';
import './RecipeDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Meal>> mealsFuture;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    mealsFuture = ApiService().fetchData(""); // Fetch all meals
  }

  Future<void> _refreshMeals() async {
    setState(() {
      mealsFuture = ApiService().fetchData("");
    });
  }

  List<Meal> filterMeals(List<Meal> meals) {
    if (searchQuery.isEmpty) return meals;
    return meals.where((meal) =>
      meal.strMeal?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search meals...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: RefreshIndicator(
                onRefresh: _refreshMeals,
                child: FutureBuilder<List<Meal>>(
                  future: mealsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Oops! Something went wrong.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Unable to load recipes at the moment.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: _refreshMeals,
                              icon: const Icon(Icons.refresh),
                              label: const Text("Try Again"),
                            ),
                          ],
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No Recipes Available",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Please check back later.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      final filteredMeals = filterMeals(snapshot.data!);
                      if (filteredMeals.isEmpty) {
                        return Center(child: Text("No meals found matching your search."));
                      }

                      return LayoutBuilder(
                        builder: (context, constraints) {
                          double screenWidth = constraints.maxWidth;
                          // Calculate maximum possible columns based on screen width
                          int maxColumns = (screenWidth / 150).floor();
                          // Calculate optimal number of columns based on item count
                          int itemCount = filteredMeals.length;
                          int optimalColumns = maxColumns;
                          // Find the number of columns that leaves minimal or no empty spaces
                          while (optimalColumns > 1) {
                            if (itemCount % optimalColumns == 0) break;
                            optimalColumns--;
                          }
                          
                          return GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            itemCount: filteredMeals.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: optimalColumns,
                              childAspectRatio: 0.85,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) {
                              Meal meal = filteredMeals[index];
                              return GestureDetector(
                                onTap: () async {
                                  final apiService = ApiService();
                                  final detailedMeal = await apiService.getMealDetails(meal.idMeal ?? "");
                                  if (detailedMeal != null) {
                                    if (context.mounted) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecipeDetails(meal: detailedMeal),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(
                                            meal.strMealThumb ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text(
                                              meal.strMeal ?? "",
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
