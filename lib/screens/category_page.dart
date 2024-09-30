import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/wallpaper.dart';
import '../widgets/wallpaper_card.dart';
import 'wallpaper_page.dart';


class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({super.key, required this.category});

  Future<List<Wallpaper>> _loadWallpapers() async {
    final String response =
        await rootBundle.loadString('assets/data/wall.json');
    final List<dynamic> data = json.decode(response);
    return data
        .where((wallpaper) => wallpaper['categories'].contains(category))
        .map<Wallpaper>((json) => Wallpaper.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: FutureBuilder<List<Wallpaper>>(
          future: _loadWallpapers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading Wallpapers'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No Wallpapers found for this category'));
            } else {
              final wallpapers = snapshot.data!;
              final screenWidth = MediaQuery.of(context).size.width;
              final crossAxisCount = screenWidth > 600 ? 4 : 2;
              return GridView.builder(
                //shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 220,
                ),
                itemCount: wallpapers.length,
                itemBuilder: (context, index) {
                  final wallpaper = wallpapers[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WallpaperPage(
                                    wallpaper: wallpaper,
                                    onFavoriteChanged: () {},
                                  )),
                        );
                      },
                      child: WallpaperCard(
                          title: wallpaper.character,
                          imageUrl: wallpaper.imageUrl));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
