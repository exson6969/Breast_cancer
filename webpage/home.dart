import 'package:breast_cancer/customClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String output = '';
  List api_input_data = [
    [
      1.316e+01,
      2.054e+01,
      8.406e+01,
      5.387e+02,
      7.335e-02,
      5.275e-02,
      1.800e-02,
      1.256e-02,
      1.713e-01,
      5.888e-02,
      3.237e-01,
      1.473e+00,
      2.326e+00,
      2.607e+01,
      7.802e-03,
      2.052e-02,
      1.341e-02,
      5.564e-03,
      2.086e-02,
      2.701e-03,
      1.450e+01,
      2.846e+01,
      9.529e+01,
      6.483e+02,
      1.118e-01,
      1.646e-01,
      7.698e-02,
      4.195e-02,
      2.687e-01,
      7.429e-02
    ]
  ];

  api_call() async {
    final response = await http.post(
        Uri.parse('https://lit-river-67219.herokuapp.com/predict_api'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
        },
        body: jsonEncode({'data': api_input_data}));
    if (response.statusCode == 200) {
      setState(() {
        output = Resopnse_api_call.from_json(jsonDecode(response.body)).r;
      });
      return Resopnse_api_call.from_json(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    api_call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Test result: $output'),
      ),
    );
  }
}
