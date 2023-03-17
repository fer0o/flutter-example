import 'package:flutter/material.dart';
import 'next_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyLoginPage());
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
          Transform.translate(
            offset: const Offset(0, 25),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: "Usuario"),
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
                              padding: const EdgeInsets.symmetric(vertical: 15)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const NextPage();
                          }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Iniciar Sesion'),
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
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('No estás registrado?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const RegisterPage();
                          }));
                              },
                              child: const Text('Registrarse'),
                            ),
                          ],
                        )
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
  //   void _login(BuildContext context) {
  //   if (!_loading) {
  //     setState(() {
  //       _loading = true;
  //     });
  //   }
  // }
  
  // void _showRegister(BuildContext context) {
  //   Navigator.of(context).pushNamed(
  //     '/register'
  //   );
  // }
}

