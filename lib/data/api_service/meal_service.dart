import 'dart:convert';
import 'package:demo_app_food_booking/data/models/meal.dart';
import 'package:http/http.dart' as http;

class MealService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  Future<List<Meal>> fetchMealsByFirstLetter(String letter) async {
    final response = await http.get(Uri.parse("${baseUrl}search.php?f=$letter"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['meals'] != null) {
        return (data['meals'] as List)
            .map((mealJson) => Meal.fromJson(mealJson))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to load meals");
    }
  }
}
