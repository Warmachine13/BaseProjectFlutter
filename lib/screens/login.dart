import 'package:flutter/material.dart';

import 'package:AprendendoFlutter/components/passwordInput.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Login extends StatefulWidget {
  final String title = "Login";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
// modulos de focus
  FocusNode nodeEmail, nodePassword = FocusNode();

  String email, password = '';

  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  showAlertDialog1(context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("teste"),
      content: Text('33'),
      actions: [
        okButton,
      ],
    );

    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  /// Função de logar
  void _logar() {
    // verifica se o formulario está valido
    if (_formKey.currentState.validate()) {
      print('entrou');
      Navigator.pushNamed(context, '/home');
      // Scaffold.of(context)
      //     .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      showAlertDialog1(context);
    }
  }

// Render do flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo.png'),
              width: 300,
              height: 300,
            ),
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
                      FocusScope.of(context).requestFocus(nodePassword);
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
                  PasswordField(
                    //fieldKey: _passwordFieldKey,
                    focusNode: nodePassword,
                    helperText: 'Não mais que 8 digitos',
                    labelText: 'Senha *',
                    onChanged: (String value) {
                      setState(() {
                        this.password = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite sua senha';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      _logar();
                    },
                  )
                ])),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                      child: Text(
                        'Esqueceu a senha ?',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/forgot')),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        elevation: 10,
                        onPressed: () {
                          _logar();
                        },
                        child: Text('Entrar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: RaisedButton(
                        color: Colors.blue,
                        elevation: 10,
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Cadastro',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                  new StoreConnector<int, String>(
                      converter: (store) => store.state.toString(),
                      builder: (context, count) {
                        return new Text(
                          count,
                          style: Theme.of(context).textTheme.display1,
                        );
                      })
                ]))
          ],
        ),
      ),
    ));
  }
}
