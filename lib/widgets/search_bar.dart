import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/search_provider.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Wallpapers',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: InputBorder.none,
              ),
              onChanged: (query) {
                context.read<WallpaperProviderSearch>().filterWallpapers(query);
              },
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus(); //close keyborad
              },
              child: Icon(Icons.search, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
