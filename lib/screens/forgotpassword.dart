import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  final String title = "ForgotPassword";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPassword> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
              ],
            ),
          ),
        ));
  }
}
