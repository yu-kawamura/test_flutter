
import 'package:flutter/material.dart';
import 'package:test_flutter/widgets/text_form_dialog.dart';
import 'package:test_flutter/repository/bookmark_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

import 'widgets/bookmark_list.dart';
import 'models/bookmark.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ブックマーク',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        backgroundColor:Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 40,
              color:Colors.white,
              ),
            onPressed: () async {
              final String? url = await showDialog<String?>(
                context: context,
                builder: (_) => TextFormDialog(
                  title: 'Add bookmark',
                  isValid: (String text) {
                    return isURL(text);
                  },
                ),
              );

              if (url != null) {
                await _createBookmark(url, ref);
              }
            },
          ),
        ],
      ),
      body: const BookmarkList(),
    );
  }

  Future<void> _createBookmark(String url, WidgetRef ref) async {
    EasyLoading.show();

    final Metadata? metadata = await MetadataFetch.extract(url);

    if (metadata != null) {
      final BookmarkRepository bookmarkRepository =
          await ref.read(bookmarkRepositoryProvider.future);
      final Bookmark newBookmark = Bookmark(
        id: const Uuid().v4(),
        url: url,
        title: metadata.title ?? '',
        imageUri: metadata.image ??
            'https://flutter.dev/images/flutter-logo-sharing.png',
        description: metadata.description ?? '',
      );
      await bookmarkRepository.create(newBookmark);
    }
    EasyLoading.dismiss();
  }
}
