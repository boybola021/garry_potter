

import 'dart:convert';
import 'package:http/http.dart';
import '../model/books_model.dart';
import '../model/characters_model.dart';

class Network{
  /// DOMAIN
  static const String baseUrl = "api.potterdb.com";

  /// APIS
  static const apiAllBooks = "/v1/books";
  static const apiCharacters = "/v1/characters";

  /// headers

  static const Map<String,String> header = {
    "Content-Type": "application/json",
  };

  static Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = header}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
    return null;
  }

/// book parse
  static List<AllBooks> parseBooksList(String data) {
    List<AllBooks> list = [];
    final  json = jsonDecode(data)["data"];
    for(int i = 0; i < json.length;i++){
     final books = AllBooks.fromJson(json[i]);
     list.add(books);
    }
    return list;
  }
  static AllBooks parseBook(String data) {
    final  json = jsonDecode(data)["data"];
    final books = AllBooks.fromJson(json);
    return books;
  }

  static List<Characters> parseCharacterList(String data) {
    List<Characters> list = [];
    final  json = jsonDecode(data)["data"];
    for(int i = 0; i < json.length;i++){
      final item = Characters.fromJson(json[i]);
      list.add(item);
    }
    return list;
  }

  static Characters parseCharacter(String data) {
    final  json = jsonDecode(data)["data"];
    final  item = Characters.fromJson(json);
    return item;
  }
}

