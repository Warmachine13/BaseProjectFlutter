import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  final String title = "Home";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  String email = '';

  FocusNode nodeEmail = FocusNode();

  final _formKey = GlobalKey<FormState>();

  _esqueceuSenha() {
    if (_formKey.currentState.validate()) {
      print('entrou');
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      //   showAlertDialog1(context);
    }
  }

//  new StoreConnector<int, String>(
//                   converter: (store) => store.state.toString(),
//                   builder: (context, count) {
//                     return new Text(
//                       count,
//                       style: Theme.of(context).textTheme.display1,
//                     );
//                   },
//                 )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text("lucas"),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        focusNode: nodeEmail,
                        initialValue: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Digite seu email',
                        ),
                        onFieldSubmitted: (_) {
                          _esqueceuSenha();
                        },
                        validator: (value) {
                          final emailvalidator =
                              RegExp('[A-Z0-9._%-]+@[A-Z0-9._%-]+\.[A-Z]{2,4}');
                          if (value.isEmpty) {
                            return 'Digite seu email';
                          } else if (emailvalidator.hasMatch(value)) {
                            return 'Digite um email valido';
                          }
                          return null;
                        },
                        onChanged: (String value) => setState(() {
                          email = value;
                        }),
                      ),
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    elevation: 10,
                    onPressed: _esqueceuSenha,
                    child: Text('Entrar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                // Text('')
                new StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return new Text(
                      count,
                      // style: Theme.of(context).textTheme.display1,
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
