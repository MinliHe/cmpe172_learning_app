import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      home: Home()
    );
  }
}
class Home extends StatelessWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Welcome to Learning Fun',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Learning Fun'),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello There!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(height: 30,),
                    Text("Automatic identity verification which enable you to verify your identity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}