import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'snack_bar.dart';

Future<void> saveImage(String imageUrl, BuildContext context) async {
  try {
    final ByteData data = await rootBundle.load(imageUrl);
    final Uint8List bytes = data.buffer.asUint8List();

    // Enregistrer l'image dans la galerie
    //String photographerName = wallpaper.photographer;

    await ImageGallerySaver.saveImage(
      bytes,
      quality: 60,
      name: 'wallpaper_',
    );

    // Afficher un message de succès (remplacez cela par votre logique d'interface utilisateur)
    //print('Image saved successfully!');

    if (context.mounted) {
      CustomSnackBar.showSuccess(context, 'Image saved successfully!');
    }
  } catch (e) {
    // Gérer les erreurs (remplacez cela par votre logique de gestion des erreurs)
    //print('Error saving image: $e');

    if (context.mounted) {
      CustomSnackBar.showSuccess(context, 'Error saving image!');
    }
  }
}
