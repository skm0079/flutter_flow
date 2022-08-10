// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow/category_model.dart';
import 'package:flutter_flow/top_bar_title.dart';
import 'package:provider/provider.dart';

import 'category_entry_page.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAUvrlCDtdIWPRbKHnct9_bxYq7X3qEcGQ", // Your apiKey
      appId: "1:722238446570:web:a6fdb6229b8d7ca01ff093", // Your appId
      messagingSenderId: "722238446570", // Your messagingSenderId
      projectId: "swarna-agilis-feature", // Your projectId
      authDomain: "swarna-agilis-feature.firebaseapp.com",
    ),
  );
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCollection =
        FirebaseFirestore.instance.collection('category');
    // For getting Firebase collection as stream
    final categoryStream = categoryCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromDoc(doc)).toList();
    });

    return StreamProvider<List<Category>>(
      initialData: const [],
      catchError: (context, e) {
        print('Catch Error Fired->> : ${e.toString()}');
        return [];
      },
      create: (_) => categoryStream,
      child: MaterialApp(
        title: 'My Category Data',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.pink),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(
                title: '',
              ),
          '/new-entry': (context) => CategoryPage.add(
              category: Category(
                  categoryPrefName: "",
                  categoryPrefShortCode: "",
                  description: "",
                  organisation: null,
                  parent: null,
                  title: "",
                  titleShortCode: "")),
          '/update': (context) => CategoryPage.edit(
              category: Category(
                  categoryPrefName: "",
                  categoryPrefShortCode: "",
                  description: "",
                  organisation: null,
                  parent: null,
                  title: "",
                  titleShortCode: "")),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final categoryEntries = Provider.of<List<Category>>(context);
    for (var element in categoryEntries) {
      print(element.title);
    }

    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(94.0),
          child: TopBarTitle(
            'Category',
          ),
        ),
        elevation: 0,
      ),
      body: const Center(),
    );
  }
}
