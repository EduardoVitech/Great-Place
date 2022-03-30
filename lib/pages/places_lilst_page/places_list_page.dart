import 'package:flutter/material.dart';
import 'package:great_place/providers/great_places/great_places.dart';
import 'package:great_place/utils/app_routes/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange.shade800,
                ),
              )
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text(
                    'Nenhum local cadastrado',
                  ),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch as Widget
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(greatPlaces.itemByIndex(i).title),
                          trailing: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
