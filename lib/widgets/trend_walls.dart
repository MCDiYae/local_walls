import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/wallpaper.dart';
import '../screens/wallpaper_page.dart';
import '../utils/search_provider.dart';
import 'wallpaper_card.dart';


class TrendWallsGrid extends StatelessWidget {
  const TrendWallsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final wallProvider = Provider.of<WallpaperProviderSearch>(context);
    final walls = wallProvider.filteredWallpapers;
    final isSearching = wallProvider.searchQuery.isNotEmpty;

    if (walls.isEmpty) {
      return const Center(child: Text('No Wallpaper found'));
    }

    final displayedWalls = isSearching
        ? walls.map((json) => Wallpaper.fromJson(json)).toList()
        : walls
            .where((wallpaper) => wallpaper['categories'].contains('trend'))
            .map((json) => Wallpaper.fromJson(json))
            .toList();

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 4 : 2;
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isSearching ? 'Search Results' : 'Popular Wallpapers',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            mainAxisExtent: 220,
          ),
          itemCount: displayedWalls.length,
          itemBuilder: (context, index) {
            final wallpaper = displayedWalls[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WallpaperPage(
                      wallpaper: wallpaper,
                      onFavoriteChanged: () {},
                    ),
                  ),
                );
              },
              child: WallpaperCard(
                title: wallpaper.character,
                imageUrl: wallpaper.imageUrl,
              ),
            );
          },
        ),
      ],
    );
  }
}
