import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moneyscroll/state_model.dart';

class CitiesProvider extends ChangeNotifier {
  List cities = [];
  List<StateModel> states = [];
  bool loading = false;

  void changeLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future fetchStates() async {
    loading = true;
    notifyListeners();

    var url =
        Uri.parse("https://api.countrystatecity.in/v1/countries/SA/states/");
    var response = await http.get(url, headers: {
      'X-CSCAPI-KEY': 'M2Q0S3p1R2ZJU01SSHB4N1Nkc2dyWGF6c2FFRm9ZVkpxTjZSdnBYTA=='
    });

    states = (jsonDecode(response.body) as List)
        .map((e) => StateModel.fromjson(e))
        .toList();
    print(states.length);
    loading = false;
    notifyListeners();
  }

  Future fetchCites() async {
    loading = true;

    var url =
        Uri.parse("https://api.countrystatecity.in/v1/countries/SA/states/01");
    var response = await http.get(url, headers: {
      'X-CSCAPI-KEY': 'M2Q0S3p1R2ZJU01SSHB4N1Nkc2dyWGF6c2FFRm9ZVkpxTjZSdnBYTA=='
    });

    states = (jsonDecode(response.body) as List)
        .map((e) => StateModel.fromjson(e))
        .toList();
    print(states.length);
    loading = false;
    notifyListeners();
  }
}
