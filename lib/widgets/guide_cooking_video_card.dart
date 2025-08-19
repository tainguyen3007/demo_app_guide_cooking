import 'package:demo_app_food_booking/core/theme/colors.dart';
import 'package:demo_app_food_booking/core/utils/get_youtube_thumnail.dart';
import 'package:demo_app_food_booking/data/models/meal.dart';
import 'package:demo_app_food_booking/features/follow_guide_cooking/screens/detail_guide_screen.dart';
import 'package:flutter/material.dart';

class GuideCookingVideoCard extends StatefulWidget {
  final Meal? meal;
  final String? urlYoutube;
  final double? rateStar;
  final String? titleVideo;
  const GuideCookingVideoCard({
    super.key,
    this.urlYoutube,
    this.rateStar = 5,
    this.titleVideo = "Tiêu đề video",
    this.meal,
  });

  @override
  State<GuideCookingVideoCard> createState() => _GuideCookingVideoCardState();
}

class _GuideCookingVideoCardState extends State<GuideCookingVideoCard> {
  bool isFavorite = false; // để toggle icon

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailGuideScreen(meal: widget.meal,)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        width: 206,
        child: Stack(
          children: [
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Thumbnail Youtube
                ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                  child: Image.network(
                    getYoutubeThumbnail(
                        widget.meal?.strYoutube ?? "https://www.youtube.com/watch?v=p2vpqKBPj4U"),
                    width: double.infinity,
                    fit: BoxFit.scaleDown,
                    
                  ),
                ),
                /// Thời gian + icon favorite
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 giờ 20 phút",
                      style: TextStyle(
                        color: AppColors.blue[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 25, // chỉnh kích thước icon
                      ),
                    ),
                  ],
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  widget.meal?.strMeal ?? "tiêu đề video",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  spacing: 8,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          "assets/default-avatar.png",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      "Nguyễn Việt Tài",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellow[600],
                      ),
                    ),
                  ],
                )
              ],
            ),
      
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffEFD503),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded, size: 18, color: Colors.white,),
                    const SizedBox(width: 4),
                    Text(
                      widget.rateStar!.toStringAsFixed(0),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
