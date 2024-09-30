import 'package:flutter/material.dart';

import '../utils/favorite_service.dart';
import '../models/wallpaper.dart';
import '../widgets/wallpaper_list.dart';
import 'wallpaper_page.dart';



class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Future<List<Wallpaper>> _favoriteWallsFuture;
  final FavoritewallpaperService _favoriteService = FavoritewallpaperService();

  @override
  void initState() {
    super.initState();
    _loadFavoriteWalls();
  }

  void _loadFavoriteWalls() {
    setState(() {
      _favoriteWallsFuture = _favoriteService.loadFavoritewallpapers();
    });
  }

  Future<void> _removeFromFavorites(Wallpaper wallpaper) async {
    await _favoriteService.removeFromFavorites(wallpaper.id);
    _loadFavoriteWalls(); // Reload the list after removing
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Walls"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Wallpaper>>(
          future: _favoriteWallsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorite Wallpapers'));
            } else {
              return _buildWallpaperList(snapshot.data!);
            }
          },
        ),
      ),
    );
  }

  Widget _buildWallpaperList(List<Wallpaper> wallpapers) {
    return ListView.builder(
      itemCount: wallpapers.length,
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
        return WallpaperListItem(
          wallpaper: wallpaper,
          onTap: () => _navigateToWallpaperPage(wallpaper),
          onRemove: () {
            _removeFromFavorites(wallpaper);
          },
        );
      },
    );
  }

  void _navigateToWallpaperPage(Wallpaper wallpaper) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WallpaperPage(
          wallpaper: wallpaper,
          onFavoriteChanged: _loadFavoriteWalls, // Pass the callback
        ),
      ),
    );
  }
}
