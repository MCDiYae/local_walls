import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WallpaperProviderSearch extends ChangeNotifier {
  List<dynamic> _allWallpapers = [];
  List<dynamic> _filteredWallpapers = [];
  String _searchQuery = '';

  List<dynamic> get filteredWallpapers => _filteredWallpapers;
  String get searchQuery => _searchQuery;

  Future<void> loadWallpapers() async {
    final String response =
        await rootBundle.loadString('assets/data/wall.json');
    _allWallpapers = json.decode(response);
    _updateFilteredWallpapers();
    notifyListeners();
  }

  void filterWallpapers(String query) {
    _searchQuery = query;
    _updateFilteredWallpapers();
    notifyListeners();
  }

  void _updateFilteredWallpapers() {
    if (_searchQuery.isNotEmpty) {
      // Show all Wallpapers that match the query
      _filteredWallpapers = _allWallpapers
          .where((wallpaper) =>
              wallpaper['character']
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase()) ||
              (wallpaper['categories'] as List<dynamic>).any((category) =>
                  category
                      .toString()
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase())))
          .toList();
    } else {
      // Show only trending Wallpapers when there's no query
      _filteredWallpapers = _allWallpapers
          .where((wallpaper) =>
              (wallpaper['categories'] as List<dynamic>).contains('trend'))
          .toList();
    }
  }

  List<dynamic> getTrendingWallpapers() {
    return _allWallpapers
        .where((wallpaper) =>
            (wallpaper['categories'] as List<dynamic>).contains('trend'))
        .toList();
  }

  List<dynamic> getAllWallpapers() {
    return _allWallpapers;
  }
}
