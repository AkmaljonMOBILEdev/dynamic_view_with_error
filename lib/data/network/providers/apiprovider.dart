import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce/data/models/widget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/universal_response.dart';

class ApiProvider {
  // final dio = Dio(BaseOptions(
  //   baseUrl: baseUrl,
  //   connectTimeout: Duration(seconds: 30),
  //   receiveTimeout: Duration(seconds: 20),
  //   sendTimeout: Duration(seconds: 60),
  // ));
  

  Future<UniversalData> fetchData() async {
    Uri uri = Uri.parse("https://dynamic-view-api.free.mockoapp.net/views");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        // print("FFFFFFFFF: ${response.data}");
        // print((response.data["dynamic_views"] as List).map((e) => WidgetModel.fromJson(e)));
        // List<WidgetModel> these = (response.data["dynamic_views"] as List?)
        //     ?.map((e) => WidgetModel.fromJson(e)).toList() ?? [];

        return UniversalData(
            data: (jsonDecode(response.body)["dynamic_views"] as List?)
                ?.map((e) => WidgetModel.fromJson(e)).toList() ?? []
        );
      }
      return UniversalData(error: "Error");
    } on DioException catch (e) {
      return UniversalData(error: e.error.toString());
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
