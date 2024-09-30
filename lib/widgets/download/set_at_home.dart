// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'snack_bar.dart';

Future<void> setAtHome(BuildContext context, String assetImagePath) async {
  try {
    // Get the ByteData from the asset
    final ByteData data = await rootBundle.load(assetImagePath);
    final List<int> bytes = data.buffer.asUint8List();

    // Get temporary directory
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_wallpaper.jpg');

    // Write the file
    await tempFile.writeAsBytes(bytes);

    // Set wallpaper
    final bool result = await WallpaperManager.setWallpaperFromFile(
      tempFile.path,
      WallpaperManager.HOME_SCREEN,
    );

    if (result) {
      CustomSnackBar.showSuccess(
          context, 'Home screen wallpaper set successfully');
    } else {
      CustomSnackBar.showSuccess(
          context, 'Failed to set home screen wallpaper');
    }
  } catch (e) {
    CustomSnackBar.showSuccess(context, 'Error $e');
  }
}
