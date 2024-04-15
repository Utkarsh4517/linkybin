import 'dart:convert';

class LinkyBinModel {
  final String url;
  final String category;
  final String shortUrl;
  LinkyBinModel({required this.url, this.category = '', this.shortUrl = ''});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'category': category,
      'shortUrl': shortUrl,
    };
  }

  factory LinkyBinModel.fromMap(Map<String, dynamic> map) {
    return LinkyBinModel(
      url: map['url'] ?? '',
      category: map['category'] ?? '',
      shortUrl: map['shortUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkyBinModel.fromJson(String source) => LinkyBinModel.fromMap(json.decode(source));
}
