import 'dart:ui';

import 'package:demo_app_food_booking/data/api_service/category_service.dart';
import 'package:demo_app_food_booking/data/api_service/meal_service.dart';
import 'package:demo_app_food_booking/data/models/category.dart';
import 'package:demo_app_food_booking/data/models/meal.dart';
import 'package:demo_app_food_booking/widgets/category_card.dart';
import 'package:demo_app_food_booking/widgets/category_tab.dart';
import 'package:demo_app_food_booking/widgets/guide_cooking_video_card.dart';
import 'package:demo_app_food_booking/widgets/search_input.dart';
import 'package:demo_app_food_booking/core/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Category>> futureCategories;
  late Future<List<Meal>> futureMeals;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryService().fetchCategories();
    futureMeals = MealService().fetchMealsByFirstLetter('c');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
            child: SearchInput(controller: TextEditingController()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(title: 'TP. Hồ Chí Minh', showAllButton: true),
              _buildFutureList<Meal>(
                future: futureMeals,
                height: 280,
                itemBuilder: (meal) => GuideCookingVideoCard(meal: meal),
              ),
              _buildSectionHeader(title: 'Danh mục', showAllButton: true),
              _buildFutureList<Category>(
                future: futureCategories,
                height: 30,
                itemBuilder: (cate) => CategoryTab(category: cate),
              ),
              _buildFutureList<Category>(
                future: futureCategories,
                height: 213,
                itemBuilder: (cate) => CategoryCard(category: cate),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Dùng generic để tái sử dụng
  Widget _buildFutureList<T>({
    required Future<List<T>> future,
    required double height,
    required Widget Function(T item) itemBuilder,
  }) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Lỗi: ${snapshot.error}");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("Không có dữ liệu");
        } else {
          final data = snapshot.data!;
          return SizedBox(
            height: height,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: data.length < 5 ? data.length : 5,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return itemBuilder(data[index]);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool showAllButton,
    VoidCallback? onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        if (showAllButton)
          TextButton(
            onPressed: onPressed ?? () {},
            style: TextButton.styleFrom(foregroundColor: AppColors.yellow[600]),
            child: const Text('Xem tất cả'),
          ),
      ],
    );
  }
}
