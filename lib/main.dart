import 'package:flutter_1/screens/silent_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/screens/google_map.dart';
import 'package:flutter_1/screens/e_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Silent app'),
            backgroundColor: Colors.transparent,
            elevation: 10,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 40,
                ),
                color: Colors.black,
                onPressed: () {
                  showSearch(context: context, delegate: Datasearch());
                },
              ),
            ]),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('SETTINGS'),
            ),
            ListTile(
              title: const Text('EMERGENCY CONTACTS'),
              trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const e_contact()))),
            ),
          ]),
        ),
        body: Stack(
          children: <Widget>[
            const Google_map(),
            Expanded(
                child: SizedBox(
              width: 900,
              height: 750,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  child: const Text('SILENT AREAS'),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const silent_area())),
                ),
              ),
            )),
            Positioned(
              bottom: 100,
              right: 5,
              child: FloatingActionButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Google_map())),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ));
  }

  RaisedButton({required Text child, required Future Function() onPressed}) {}
}

class Datasearch extends SearchDelegate<String> {
  final cities = [
    "Bhandup",
    "Mumbai",
    "Coimbature",
    "Chennai",
    "Agra",
    "Jaipur",
    "Hyderbad",
    "New delhi",
    "Pune",
    "Goa",
    "Salem",
    "ooty",
    "trichy",
    "bengalore",
    "kerala",
    "kochin",
    "Neiveli",
    "Dharmapuri",
    "Hosur",
  ];
  final recentCities = [
    "Coimbature",
    "Chennai",
    "Salem",
    "NewDelhi",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = " ";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (contex, index) => ListTile(
        leading: const Icon(Icons.location_city),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: const TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
