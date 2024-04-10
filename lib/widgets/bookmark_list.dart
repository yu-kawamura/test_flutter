import 'package:flutter/material.dart';
import 'package:test_flutter/models/bookmark.dart';
import 'package:test_flutter/repository/bookmark_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bookmark_card.dart';

final bookmarkRepositoryProvider =
    FutureProvider((ref) => BookmarkRepository.open());

class BookmarkList extends ConsumerWidget {
  const BookmarkList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBookmarkRepository = ref.watch(bookmarkRepositoryProvider);
    return asyncBookmarkRepository.when(
      data: (BookmarkRepository bookmarkRepository) {

        return StreamBuilder(
          stream: bookmarkRepository.stream,
          builder: (_, AsyncSnapshot<BoxEvent> snapshot) {
            final List<Bookmark> bookmarks = bookmarkRepository.bookmarks;

            if (bookmarks.isEmpty) {
              return const Center(
                child: Text('No bookmarks...'),
              );
            }

            return ListView.builder(
              itemBuilder: (_, int index) {
                return Dismissible(
                  key: Key(bookmarks[index].id),
                  child: Stack(
                    children: [
                      BookmarkCard(bookmarks[index]),

                      Align(
                        alignment: const Alignment(1, -1),
                          child: IconButton(
                            icon:  const Icon(
                            Icons.clear,
                            size: 40,
                            color:Color.fromARGB(255, 87, 87, 87),
                            ),
                            onPressed: () async {
                              await bookmarkRepository.delete(bookmarks[index]);
                            },
                          ),
                      ),
                    ]
                  ),
                  onDismissed: (DismissDirection direction) async {
                    await bookmarkRepository.delete(bookmarks[index]);
                  },
                );
              },
              itemCount: bookmarks.length,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: CircularProgressIndicator()),
    );
  }
}