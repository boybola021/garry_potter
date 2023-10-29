


class AllBooks{
   String id;
   String? type;
   Attributes attributes;
   Relationships relationships;
   // Meta meta;
   // Link link;
   AllBooks({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory AllBooks.fromJson(Map<String,Object?>json){
    return AllBooks(
        id: json["id"] as String,
        type: json["type"] as String,
        attributes: Attributes.fromJson(json["attributes"]  as Map<String,Object?>),
        relationships: Relationships.fromJson(json["relationships"] as Map<String,Object?>),
      // meta:  Meta.fromJson(json["meta"] as Map<String,Object?>),
      // link:  Link.fromJson(json["link"] as Map<String,Object?>),
    );
  }
}

class Attributes {
  String slug;
  String title;
  String summary;
  String author;
  String releaseDate;
  String dedication;
  int pages;
  int order;
  String cover;
  String wiki;

  Attributes({
    required this.slug,
    required this.title,
    required this.summary,
    required this.author,
    required this.releaseDate,
    required this.dedication,
    required this.pages,
    required this.order,
    required this.cover,
    required this.wiki,
  });

  factory Attributes.fromJson(Map<String, Object?> json) => Attributes(
    slug: json["slug"] as String,
    title: json["title"] as String,
    summary: json["summary"] as String,
    author: json["author"] as String,
    releaseDate: json["release_date"] as String,
    dedication: json["dedication"] as String,
    pages: json["pages"] as int,
    order: json["order"] as int,
    cover: json["cover"] as String,
    wiki: json["wiki"] as String,
  );

}

 class Relationships{
 Chapters chapters;
 Relationships({required this.chapters});
  factory Relationships.fromJson(Map<String,Object?> json){
    return Relationships(
        chapters: Chapters.fromJson(json["chapters"] as Map<String,Object?>),
    );
  }
 }

class Chapters {
  List<ChaptersData> data;
  Chapters({
    required this.data,
  });

  factory Chapters.fromJson(Map<String, Object?> json) => Chapters(
    data:  (json["data"] as List).map((e) => ChaptersData.fromJson(e)).toList(),
  );

}

class ChaptersData{
  String id;
  String type;
  ChaptersData({required this.id,required this.type});

  factory ChaptersData.fromJson(Map<String,Object?>json){
    return ChaptersData(id: json["id"] as String, type: json["type"] as String);
  }
}

class Meta {
  String copyright;
  String generatedAt;
  Pagination pagination;
  Meta({required this.copyright,required this.generatedAt,required this.pagination});

  factory Meta.fromJson(Map<String,Object?> json){
    return Meta(
        pagination: Pagination.fromJson(json["pagination"]  as Map<String,Object?>),
        copyright: json["copyright"] as String,
        generatedAt: json["generated_at"] as String
    );
  }
}

class Pagination {
  int current;
  int records;

  Pagination({
    required this.current,
    required this.records,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    current: json["current"],
    records: json["records"],
  );
}

class Link{
  String link;

  Link({required this.link});

  factory Link.fromJson(Map<String,Object?>json){
    return Link(link: json["link"] as String);
  }
}



/*
class AllBooks {
  List<AllBooksDatum> data;
  Meta meta;
  Links links;

  AllBooks({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory AllBooks.fromJson(Map<String, dynamic> json) => AllBooks(
    data: List<AllBooksDatum>.from(json["data"].map((x) => AllBooksDatum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
    links: Links.fromJson(json["links"]),
  );

}

class AllBooksDatum {
  String id;
  String type;
  Attributes attributes;
  Relationships relationships;

  AllBooksDatum({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory AllBooksDatum.fromJson(Map<String, dynamic> json) => AllBooksDatum(
    id: json["id"],
    type: json["type"],
    attributes: Attributes.fromJson(json["attributes"]),
    relationships: Relationships.fromJson(json["relationships"]),
  );
}

class Attributes {
  String slug;
  String title;
  String summary;
  String author;
  DateTime releaseDate;
  String dedication;
  int pages;
  int order;
  String cover;
  String wiki;

  Attributes({
    required this.slug,
    required this.title,
    required this.summary,
    required this.author,
    required this.releaseDate,
    required this.dedication,
    required this.pages,
    required this.order,
    required this.cover,
    required this.wiki,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    slug: json["slug"],
    title: json["title"],
    summary: json["summary"],
    author: json["author"],
    releaseDate: DateTime.parse(json["release_date"]),
    dedication: json["dedication"],
    pages: json["pages"],
    order: json["order"],
    cover: json["cover"],
    wiki: json["wiki"],
  );

}

class Relationships {
  Chapters chapters;

  Relationships({
    required this.chapters,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
    chapters: Chapters.fromJson(json["chapters"]),
  );

}

class Chapters {
  List<ChaptersDatum> data;

  Chapters({
    required this.data,
  });

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
    data: List<ChaptersDatum>.from(json["data"].map((x) => ChaptersDatum.fromJson(x))),
  );
}

class ChaptersDatum {
  String id;
  Type type;

  ChaptersDatum({
    required this.id,
    required this.type,
  });

  factory ChaptersDatum.fromJson(Map<String, dynamic> json) => ChaptersDatum(
    id: json["id"],
    type: typeValues.map[json["type"]]!,
  );

}

enum Type { CHAPTER }

final typeValues = EnumValues({
  "chapter": Type.CHAPTER
});

class Links {
  String self;
  String current;

  Links({
    required this.self,
    required this.current,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"],
    current: json["current"],
  );
}

class Meta {
  Pagination pagination;
  String copyright;
  DateTime generatedAt;

  Meta({
    required this.pagination,
    required this.copyright,
    required this.generatedAt,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    pagination: Pagination.fromJson(json["pagination"]),
    copyright: json["copyright"],
    generatedAt: DateTime.parse(json["generated_at"]),
  );
}

class Pagination {
  int current;
  int records;

  Pagination({
    required this.current,
    required this.records,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    current: json["current"],
    records: json["records"],
  );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
*/