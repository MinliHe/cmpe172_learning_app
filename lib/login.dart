import 'package:cmpe172_learning_app/video.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<Login>
{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool processing = false;

  void login() async
  {
    setState(() {
      processing = true;
    });
    var url = "https://undrunk-surveyor.000webhostapp.com/cmpe172/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "Email": email.text,
      "Password": password.text,
    });

    var data = await json.decode(json.encode(response.body));

    if (data == "Do not have an account") {
      Fluttertoast.showToast(msg: 'Do not have an account, create account');
    }
    else
    {
      if (data == "false")
      {
        Fluttertoast.showToast(msg: 'Incorrect password');
      }
      else
      {
        print(jsonDecode(data));
      }
    }
    setState(() {
      processing = false;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar : AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading:
            IconButton( onPressed:()
            {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios, size:20, color:Colors.black,)),
        ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text ("Login", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Text("Welcome back! Log in to check your progress.", style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                ),),
                const SizedBox(height: 30,)
              ],
            ),
            Padding(
              padding:const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Column(
                children: [
                  makeInputEmail(label: "Email"),
                  makeInputPassword(label: "Password", obscureText: true),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: const Border(
                    bottom: BorderSide(color:Colors.black),
                    top: BorderSide(color:Colors.black),
                    right: BorderSide(color:Colors.black),
                    left: BorderSide(color:Colors.black),
                  )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Video()),
                    );
                  },
                  color: Colors.indigoAccent[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: const Text("Login", style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white70
                  ),),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Don't have an account?"),
                Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget makeInputEmail({label, obscureText = false})
{
  TextEditingController email = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style:const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        controller: email,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30,)
    ],
  );
}

Widget makeInputPassword({label, obscureText = false})
{
  TextEditingController password = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      const SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        controller: password,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      const SizedBox(height: 30,)
    ],
  );
}
