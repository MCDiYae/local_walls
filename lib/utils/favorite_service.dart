import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/wallpaper.dart';


class FavoritewallpaperService {
  static const String _favoritewallpapersKey = 'favoritewallpapers';

  Future<List<Wallpaper>> loadFavoritewallpapers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritewallpaperIds =
          prefs.getStringList(_favoritewallpapersKey) ?? [];
      final allwallpapers = await _fetchAllwallpapers();

      return allwallpapers
          .where((wallpaper) => favoritewallpaperIds.contains(wallpaper.id))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error loading favorite wallpapers: $e');
      return [];
    }
  }

  Future<List<Wallpaper>> _fetchAllwallpapers() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/wall.json');
      final List<dynamic> data = json.decode(response);

      return data.map<Wallpaper>((json) => Wallpaper.fromJson(json)).toList();
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching all wallpapers: $e');
      return [];
    }
  }

  Future<bool> isFavorite(String wallpaperId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritewallpaperIds =
        prefs.getStringList(_favoritewallpapersKey) ?? [];
    return favoritewallpaperIds.contains(wallpaperId);
  }

  Future<bool> toggleFavorite(String wallpaperId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritewallpaperIds =
        prefs.getStringList(_favoritewallpapersKey) ?? [];

    if (favoritewallpaperIds.contains(wallpaperId)) {
      favoritewallpaperIds.remove(wallpaperId);
    } else {
      favoritewallpaperIds.add(wallpaperId);
    }

    await prefs.setStringList(_favoritewallpapersKey, favoritewallpaperIds);
    return favoritewallpaperIds.contains(wallpaperId);
  }

  Future<void> removeFromFavorites(String wallpaperId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritewallpaperIds =
        prefs.getStringList(_favoritewallpapersKey) ?? [];
    favoritewallpaperIds.remove(wallpaperId);
    await prefs.setStringList(_favoritewallpapersKey, favoritewallpaperIds);
  }
}
