
import 'package:flutter/material.dart';

import 'ApiProvider.dart';

class Repo {
  final ApiProvider _apiprovider = ApiProvider();

  Future<dynamic> postProduct(BuildContext context,
      Map<String, dynamic> map) async {
    final response = await _apiprovider.post(context, "", map);
    return response;
  }
}