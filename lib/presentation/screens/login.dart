import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWIwamF4Y3VzZGZjNHk3cXNwYm53bW13dGVpOHY3c3VjbGdpcHBhMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/WDZBrmwNjm5g8qsl1F/giphy.gif"))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login - API",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Ingresa tu nombre de usuario'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu nombre de usuario';
                        }
                        if (value != 'api') {
                          return "Usuario no encontrado";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Ingrese su constraseña'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor ingresa tu contraseña";
                        }
                        if (value != "123456") {
                          return "Constraseña no válida";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/api');
                        }
                      },
                      child: const Text(
                        "Iniciar sesión",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
