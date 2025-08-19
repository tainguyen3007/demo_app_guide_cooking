import 'package:demo_app_food_booking/core/theme/colors.dart';
import 'package:demo_app_food_booking/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
   const CategoryCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 213,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 58),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.yellow[600]?.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32,bottom: 12,right: 16,left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              maxLines: 1,
                              category?.strCategory ?? "Chiên trứng",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: AppColors.yellow[900],
                              ),
                            ),
                            Text(
                              "Tạo bởi\nTài Nguyễn",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: AppColors.yellow[950],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "20 phút",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: AppColors.yellow[950]
                              ),
                            ),
                            Icon(Icons.sticky_note_2_rounded, color: AppColors.yellow[950],)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
          ),
          Positioned(
            top: 6,
            left: 35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                category?.strCategoryThumb ??
                "https://www.themealdb.com/images/category/chicken.png",
                width: 80,
                height: 80,
                fit: BoxFit.cover,)
            )
          ),
        ],
      ),
    );
  }
}