import 'package:cmpe172_learning_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'login.dart';

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
                    Text(
                      "Ready for some fun!", textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  decoration: const BoxDecoration(
                      image:DecorationImage(image: AssetImage('assets/kidsLearn.png'))
                  ),
                ),

                //Login Button.
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  //action listener for login button.
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  color: Colors.indigoAccent[200],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white70
                  ),),
                ),

                //Sign Up button.
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  //action listener for sign up button.
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  },
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text("Sign Up", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white70
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}












