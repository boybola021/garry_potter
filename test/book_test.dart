

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garry_potter/model/books_model.dart';
import 'package:garry_potter/service/network_service.dart';

void main(){

  group("Book all", () {
    test("book api and pars", () async {
      await Network.methodGet(api: Network.apiAllBooks).then((data) {
        //  debugPrint("======$data======");
      });
    });
    test("book api and pars", () async {
      await Network.methodGet(api: Network.apiAllBooks).then((data) {
        List list = Network.parseBooksList(data!);
        debugPrint("======$list======");
        expect(list, const TypeMatcher<AllBooks>());
      });
    });
    test("book api and pars", () async {
      await Network.methodGet(api: Network.apiAllBooks, id: 1).then((data) {
        final book = Network.parseBook(data!);
        debugPrint("======$book======");
        expect(book, const TypeMatcher<AllBooks>());
      });
    });
  });
}