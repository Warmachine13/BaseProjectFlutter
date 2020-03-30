import "package:redux/redux.dart";
import 'package:redux_logging/redux_logging.dart';

import 'package:AprendendoFlutter/ducks/redux/auth.dart';
//   var store = new Store<dynamic>(
//   (dynamic state, dynamic action) => state + 1,
//   dynamic initialValue: 0,
//   // Note the LoggingMiddleware should come last in the list of Middleware!
//   middleware: [new LoggingMiddleware.printer()]
// );

class Person = {
  String username,email,password = '';
}

final store = new Store<dynamic>(
  counterReducer,
  Person(),
  middleware: [new LoggingMiddleware.printer()],
);
