import 'package:flutter/material.dart';

extension PasswordValidation on String {
  bool inputValidate() {
    return contains(RegExp(r'[0–9]'));
  }
}

class DesignUi extends StatefulWidget {
  const DesignUi({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DesignUiState();
  }
}

class _DesignUiState extends State<DesignUi> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input validation'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone no',
                    hintText: 'Please enter the phone no',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field could not empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.brown,
                    labelText: 'E_mail',
                    hintText: 'Please enter the email',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  obscureText: !_passwordVisibility,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Please enter the password',
                      suffixIcon: IconButton(
                        icon: Icon(_passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field should not empty';
                    } else if (value.inputValidate()) {
                      return null;
                    } else {
                      return 'Password should be 9';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Loading')));
                    }
                  },
                  child: const Text(
                    'Validate',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
