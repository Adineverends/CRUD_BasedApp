
import 'package:coudstore/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _intialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _intialization,
      builder: (context , snapshot) {
        if (snapshot.hasError) {
          print("something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'FLutter Firestore CRUD',
              theme: ThemeData(
                  primarySwatch: Colors.blue
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage()

          );
        }
        return CircularProgressIndicator();
      },);
    }
  }
