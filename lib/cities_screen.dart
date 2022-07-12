import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneyscroll/cities_cubit/cities_cubit.dart';
import 'package:moneyscroll/cities_cubit/cities_states.dart';
import 'package:moneyscroll/cities_provider.dart';
import 'package:provider/provider.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  @override
  Widget build(BuildContext context) {
    String? stateChoosen;
    String? CountryChoosen;

    return Scaffold(
        body: BlocProvider(
      create: (context) => CitiesCubit()..fetchStates(),
      child: BlocConsumer<CitiesCubit, CitiesStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CitiesCubit.get(context).loading
                    ? CircularProgressIndicator()
                    : Text("${CitiesCubit.get(context).states.length}"),
                DropdownButton(
                    hint: Text("Cities"),
                    value: stateChoosen,
                    onChanged: (value) {
                      setState(() {
                        stateChoosen = value.toString();
                      });
                    },
                    items: CitiesCubit.get(context)
                        .states
                        .map((e) => DropdownMenuItem(
                              child: Text(e.name!),
                              value: e,
                            ))
                        .toList()),
                ElevatedButton(onPressed: () {}, child: Text("press me"))
              ],
            ),
          );
        },
      ),
    ));
  }
}
