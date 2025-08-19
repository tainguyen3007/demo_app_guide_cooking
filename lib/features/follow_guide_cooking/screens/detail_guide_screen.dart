import 'package:demo_app_food_booking/core/theme/colors.dart';
import 'package:demo_app_food_booking/core/utils/get_youtube_thumnail.dart';
import 'package:demo_app_food_booking/data/models/meal.dart';
import 'package:flutter/material.dart';

class DetailGuideScreen extends StatefulWidget {
  final Meal? meal;
  const DetailGuideScreen({super.key, this.meal});

  @override
  State<DetailGuideScreen> createState() => _DetailGuideScreenState();
}

class _DetailGuideScreenState extends State<DetailGuideScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal?.strMeal ?? "Chi tiết món ăn"),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            // Ảnh video youtube
            Container(
              width: double.infinity,
              height: 288,
              color: Colors.black,
              child: Image.network(
                getYoutubeThumbnail(widget.meal?.strYoutube ??
                    "https://www.youtube.com/watch?v=2t6Bt04EyLw"),
                errorBuilder: (context, error, stackTrace) => Image.network(
                    getYoutubeThumbnail(
                        "https://www.youtube.com/watch?v=2t6Bt04EyLw")),
              ),
            ),

            // Thông tin cơ bản
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên món + nút favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.meal?.strMeal ?? "Tên món ăn",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  // Đánh giá
                  Row(
                    spacing: 5,
                    children: const [
                      Icon(Icons.star, color: Colors.yellow),
                      Text("4.2 | 120 đánh giá"),
                    ],
                  ),

                  // Tác giả
                  Row(
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/default-avatar.png"),
                        ),
                      ),
                      Text("Nguyễn Việt Tài",
                          style: TextStyle(
                              color: AppColors.yellow[600],
                              fontWeight: FontWeight.bold))
                    ],
                  ),

                  // Gạch ngang
                  Container(
                    color: AppColors.yellow[600],
                    height: 2,
                  ),

                  // --- TAB ở dưới ---
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: "Nguyên liệu"),
                            Tab(text: "Chế biến"),
                          ],
                          labelColor: Colors.black,
                          indicatorColor: Colors.amber,
                        ),
                        SizedBox(
                          height: 300, // chiều cao cho nội dung tab
                          child: TabBarView(
                            children: [
                              // Tab 1: Nguyên liệu
                              SingleChildScrollView(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: widget.meal?.ingredients.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final ingredient = widget.meal?.ingredients[index];
                                        final measure = widget.meal?.measures[index];
                                        if (ingredient == null || ingredient.isEmpty) {
                                          return const SizedBox.shrink();
                                        }
                                        return ListTile(
                                          leading: const Icon(Icons.circle, size: 8),
                                          title: Text("$ingredient - ${measure ?? ''}"),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              // Tab 2: Chế biến
                              SingleChildScrollView(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  widget.meal?.strInstructions ??
                                      "1. Sơ chế nguyên liệu\n2. Nấu theo công thức...\n3. Thưởng thức",
                                  style: const TextStyle(
                                      fontSize: 14, height: 1.5),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
