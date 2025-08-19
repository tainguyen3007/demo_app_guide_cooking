import 'package:demo_app_food_booking/core/theme/colors.dart';
import 'package:demo_app_food_booking/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatefulWidget {
  final Category? category;

  const CategoryTab({super.key, this.category});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.yellow[600] : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.yellow[600]! : (AppColors.gray[800] ?? Colors.black),
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Text(
          widget.category?.strCategory ?? "category name",
          style: TextStyle(
            color: isSelected ? Colors.white : (AppColors.gray[800] ?? Colors.black),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
