import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyscroll/cities_cubit/cities_states.dart';
import 'package:http/http.dart' as http;
import 'package:moneyscroll/state_model.dart';

class CitiesCubit extends Cubit<CitiesStates> {
  CitiesCubit() : super(CitiesStateInitial());
  List cities = [];
  List<StateModel> states = [];
  bool loading = false;

  static CitiesCubit get(context) => BlocProvider.of(context);

  Future fetchStates() async {
    loading = true;
    emit(CitiesStateInitial());

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
    emit(CitiesStateSuccess());
  }
}
