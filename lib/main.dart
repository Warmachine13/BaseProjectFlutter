import 'package:flutter/material.dart';

import 'package:AprendendoFlutter/screens/forgotpassword.dart';
import 'package:AprendendoFlutter/screens/register.dart';
import 'package:AprendendoFlutter/screens/login.dart';
// import 'package:AprendendoFlutter/screens/home.dart';
import 'package:AprendendoFlutter/navigators/bottomNavigator.dart';

import 'package:AprendendoFlutter/ducks/index.dart';

import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// inicio da aplicação
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // inicio com navegação de rotas
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            // '/': (BuildContext context) => MyHomePage(),
            '/': (BuildContext context) => Login(),
            '/register': (BuildContext context) => Register(),
            '/forgot': (BuildContext context) => ForgotPassword(),
            '/home': (BuildContext context) => OtherNavigator(),
          },
        ));
  }
}
