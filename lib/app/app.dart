

import 'package:flutter/material.dart';
import '../pages/books_page.dart';
import '../pages/main_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksPage(),
    );
  }
}
