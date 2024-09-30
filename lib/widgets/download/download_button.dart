
import 'package:flutter/material.dart';

import 'save_image.dart';
import 'set_at_home.dart';
import 'set_lock.dart';


class DownloadButton extends StatefulWidget {
  final String imageUrl;
  const DownloadButton({
    super.key,
    required this.imageUrl,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Builder(
        builder: (context) => PopupMenuButton<String>(
          color: Theme.of(context).primaryColor,
          position: PopupMenuPosition.over,
          offset: const Offset(15, -210),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (value) {
            switch (value) {
              case 'save':
                saveImage(
                  widget.imageUrl,
                  context,
                );
                break;
              case 'setHome':
                setAtHome(context, widget.imageUrl);
                break;
              case 'setLock':
                setAtLock(context, widget.imageUrl);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'save',
              child: ListTile(
                leading: Icon(
                  Icons.save,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Save',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'setHome',
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Set as Home',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'setLock',
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Set as Lock',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
          child: Icon(
            Icons.download,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}