import 'package:cmpe172_learning_app/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main()
{
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    )
  );
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<HomePage>
{
  bool signIn = true;

  void changeState()
  {
    if(signIn)
      {
        setState(() {
          signIn = false;
        });
      }
    else {
      setState(() {
        signIn = true;
      });
    }
  }


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
                    changeState();
                    if(signIn == true)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      }
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
                  ) ,),
                ),

                //Sign Up button.
                MaterialButton(
                  minWidth: double.infinity,
                  height:60,
                  //action listener for sign up button.
                  onPressed: (){
                    changeState();
                    if(signIn == false)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Signup()),
                        );
                      }
                  },
                  color: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text("Signup", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white70
                  ),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}












