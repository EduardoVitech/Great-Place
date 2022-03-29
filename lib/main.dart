import 'package:flutter/material.dart';
import 'package:great_place/pages/place_form_page/place_form_page.dart';
import 'package:great_place/pages/places_lilst_page/places_list_page.dart';
import 'package:great_place/providers/great_places/great_places.dart';
import 'package:great_place/utils/app_routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Place',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PlacesListPage(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormPage(),
        },
      ),
    );
  }
}
