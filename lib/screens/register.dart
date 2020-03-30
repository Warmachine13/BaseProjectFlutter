import 'package:flutter/material.dart';

import 'package:AprendendoFlutter/components/passwordInput.dart';

class Register extends StatefulWidget {
  final String title = "Register";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Register> {
  FocusNode nodeUsername, nodeEmail, nodePassword = FocusNode();

  String username, email, password = '';

  final _formKey = GlobalKey<FormState>();

  /// Função de registar
  _registrar() {
    // verifica se o formulario está valido
    if (_formKey.currentState.validate()) {
      print('entrou');
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      //  showAlertDialog1(context);
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
                      focusNode: nodeUsername,
                      initialValue: username,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Digite seu Nome completo',
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
                          _registrar();
                        })
                  ])),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(children: <Widget>[
                    RaisedButton(
                      color: Colors.lightBlue,
                      elevation: 10,
                      onPressed: _registrar,
                      child: Text('Cadastar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
