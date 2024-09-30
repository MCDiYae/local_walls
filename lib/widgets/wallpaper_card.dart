import 'package:flutter/material.dart';

class WallpaperCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const WallpaperCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          // Container(
          //   width:
          //       double.infinity, // Ensures the text container fills the width
          //   color: Colors.white, // Optional: background color for text
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     title,
          //     style: Theme.of(context).textTheme.titleMedium,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
        ],
      ),
    );
  }
}
