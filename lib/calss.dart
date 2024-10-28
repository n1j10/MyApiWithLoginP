import 'dart:convert';
import 'package:http/http.dart' as http;
class Crud {
  // C create , R read , U update , D delete
  Future getProducts(String text) async {
    http.Response request = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (request.statusCode == 200) {
      var result = jsonDecode(request.body);
      print(result);
      return result;
    } else {
      return "error to get result";
    }
  }
  // used in post function
  postRequest(String title) async {
    try {
      var request =
      await http.post(Uri.parse("https://dummyjson.com/products/add"),
          body: ({
            "title": title,
          }));
      if (request.statusCode == 201) {
        var result = jsonEncode(request.body);
        print(request.statusCode);
        print(result);
        return result;
      } else {
        return "error to get result";
      }
    } catch (e) {
      print("error1 $e");
    }
  }
  putProducts(String titlePut) async {
    try {
      var request = await http.put(
          Uri.parse("https://dummyjson.com/products/1"),
          body: ({"title": titlePut}));
      if (request.statusCode == 200) {
        var result = jsonEncode(request.body.toString());
        print(result);
        return result;
      } else {
        print("Error 1");
        return "error to get result";
      }
    } catch (e) {
      print("error2 ");
    }
  }
  deleteProducts(String id) async {
    try {
      var request = await http.delete(
        Uri.parse("https://dummyjson.com/products/1"),
      );
      if (request.statusCode == 200) {
        var result = jsonDecode(request.body.toString());
        print(result);
        return result;
      } else {
        return "error to get result";
      }
    } catch (e) {
      print("error1");
    }
  }
}