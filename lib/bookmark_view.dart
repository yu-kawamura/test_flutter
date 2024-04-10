
import 'package:flutter/material.dart';
import 'package:test_flutter/models/bookmark.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView(this._bookmark, {super.key});

  final Bookmark _bookmark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bookmark.title),
      ),
      body: WebView(
        initialUrl: _bookmark.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
