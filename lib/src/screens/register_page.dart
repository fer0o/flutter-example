import 'package:flutter/material.dart';
import 'package:flutter_project/src/screens/login_page.dart';
import 'next_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan.shade200, Colors.cyan.shade800])),
            height: 300,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/fort-b6990.appspot.com/o/pngwing.com.png?alt=media&token=0c31fb31-5a8d-4d37-9363-f9208064a19c',
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: kToolbarHeight + 25,
            child: AppBar(elevation: 0, backgroundColor: Colors.transparent),
          ),
          Transform.translate(
            offset: const Offset(0, 25),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Usuario"),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Contraseña"),
                          //se usa para ocultar la contraseña
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const LoginPage();
                            }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Registrar'),
                              if (_loading)
                                Container(
                                  height: 20,
                                  width: 20,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white)),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
