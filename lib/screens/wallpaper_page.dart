// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utils/favorite_service.dart';
import '../models/wallpaper.dart';
import '../widgets/download/download_button.dart';
import '../widgets/favorite_button.dart';


class WallpaperPage extends StatefulWidget {
  final Wallpaper wallpaper;
  final VoidCallback onFavoriteChanged;
  const WallpaperPage(
      {super.key, required this.wallpaper, required this.onFavoriteChanged});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  late Future<bool> _isFavoriteFuture;
  final FavoritewallpaperService _favoriteService = FavoritewallpaperService();

  @override
  void initState() {
    super.initState();
    _isFavoriteFuture = _favoriteService.isFavorite(widget.wallpaper.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            _buildWallImage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                            height: 50,
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.all(16),
                            child: _buildWallTitle()),
                      ),
                      const SizedBox(width: 16),
                      DownloadButton(
                        imageUrl: widget.wallpaper.imageUrl,
                      ),
                    ],
                  )),
            )
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: _buildBackButton(),
      actions: [_buildFavoriteButton()],
    );
  }

  Widget _buildBackButton() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return FutureBuilder<bool>(
      future: _isFavoriteFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return FavoriteButton(
          isFavorite: snapshot.data ?? false,
          onPressed: _toggleFavorite,
        );
      },
    );
  }

  Future<void> _toggleFavorite() async {
    final isFavorite =
        await _favoriteService.toggleFavorite(widget.wallpaper.id);
    setState(() {
      _isFavoriteFuture = Future.value(isFavorite);
    });
    widget.onFavoriteChanged();
  }

  Widget _buildWallImage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.wallpaper.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildWallTitle() {
    return Center(
      child: Text(
        widget.wallpaper.character,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
