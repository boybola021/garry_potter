



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garry_potter/service/network_service.dart';

void main(){

  group("Characters all", () {
    test("book api", () async {
      await Network.methodGet(api: Network.apiCharacters).then((data) {
        debugPrint("======$data======");
      });
    });
    test("character api and pars", () async {
      await Network.methodGet(api: Network.apiAllBooks).then((data) {
        List list = Network.parseCharacterList(data!);
        debugPrint("======$list======");
      });
    });
  test("character api and pars one", () async {
      await Network.methodGet(api: Network.apiCharacters,id: "a3701158-39ed-4687-8b9a-a799cfca5811").then((data) {
        final book = Network.parseCharacter(data!);
        debugPrint("======$book======");
      });
    });
  });
}