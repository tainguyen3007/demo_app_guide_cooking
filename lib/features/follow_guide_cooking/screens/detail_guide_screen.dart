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
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            Container(
              width: double.infinity,
              height: 288,
              color: Colors.black,
              child: Image.network(
                getYoutubeThumbnail(widget.meal?.strYoutube??"https://www.youtube.com/watch?v=2t6Bt04EyLw"),
                errorBuilder:(context, error, stackTrace) 
                => Image.network(getYoutubeThumbnail("https://www.youtube.com/watch?v=2t6Bt04EyLw"))
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.meal?.strMeal ?? "tittle meal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 25, 
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}