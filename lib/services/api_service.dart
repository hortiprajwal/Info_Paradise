import 'dart:convert';
import 'package:NewsApp/model/article_model.dart';
import 'package:http/http.dart';

//make the HTTP request services
// this class will allows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //add an Endpoint URL, use a single endpoint

  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=58a7d516053c4cfe99f6f95adac0d810";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    //we got a 200 status code: request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
