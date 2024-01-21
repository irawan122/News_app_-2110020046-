import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

class ApiService2 {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      //'country': 'id',
      'q': 'automotive',
      'apiKey': '1a910cf3f3924f67ad057f3cbe5d5f15'
    };

    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
