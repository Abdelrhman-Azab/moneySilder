import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyscroll/cities_cubit/cities_cubit.dart';
import 'package:moneyscroll/cities_provider.dart';
import 'package:moneyscroll/cities_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CitiesCubit()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CitiesProvider>(
            create: (context) => CitiesProvider(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: CitiesScreen()),
      ),
    );
  }
}
