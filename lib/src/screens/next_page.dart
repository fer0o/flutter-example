import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// next page
class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<dynamic> _users = [];
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi libro de Recetas'),
      ),
      body: _users.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: [
                    Image.network(_users[index]['image'], width: 99, height: 100,),
                    Column(
                      children: [
                        Text(
                          _users[index]['firstName'],
                        ),
                        Text(
                          _users[index]['lastName'],
                        ),
                        Text(
                          _users[index]['email'],
                        ),
                        Text(_users[index]['phone'])
                      ],
                    )
                  ],
                ));
              },
            )
          : Container(
              child: Center(
                child: _loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          loadUserLis();
                        },
                        child: const Text('Load users')),
              ),
            ),
    );
  }

  void loadUserLis() async {
    setState(() {
      _loading = true;
    });
    var res = await http.get(Uri.https("dummyjson.com", "users"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      setState(() {
        _users = jsonData['users'];
        _loading = false;
      });
    }
  }
}
