import 'package:flutter/material.dart';

void main() => runApp(const Formulario());

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "El correo es requerido";
                      } else if (!value.contains("@")) {
                        return "El correo no es válido";
                      } else if (!value.endsWith(".com")) {
                        return "El dominio del correo debe ser '.com'";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Correo electrónico",
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "La contraseña es requerida";
                      } else if (value.length < 8) {
                        return "La contraseña debe tener mínimo 8 caracteres";
                      } else if (!RegExp(r'\d').hasMatch(value)) {
                        return "La contraseña debe contener al menos un número";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contraseña",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Excelente");
                      } else {
                        print("Error!");
                      }
                    },
                    child: const Text("Validar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
