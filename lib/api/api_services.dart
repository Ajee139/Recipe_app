import 'dart:convert';
import 'package:recipe/model/meal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";
  static const String searchUrl = "$baseUrl/search.php?s=";
  static const String lookupUrl = "$baseUrl/lookup.php?i=";

  Future<List<Meal>> fetchData(String query) async {
    try {
      final url = query.isEmpty 
          ? "$baseUrl/search.php?s=a" // Using 'a' to get a subset of meals
          : searchUrl + query;
      
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data["meals"] != null) {
          // Parse data into MealModel, then return the list of meals
          MealModel mealModel = MealModel.fromJson(data);
          return mealModel.meals ?? [];
        } else {
          return []; // Return an empty list if no meals are found
        }
      } else {
        throw Exception("Can't load data from meals, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  Future<Meal?> getMealDetails(String mealId) async {
    try {
      final response = await http.get(Uri.parse(lookupUrl + mealId));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data["meals"] != null && (data["meals"] as List).isNotEmpty) {
          return Meal.fromJson(data["meals"][0]);
        }
      }
      return null;
    } catch (e) {
      throw Exception("Error fetching meal details: $e");
    }
  }
}
