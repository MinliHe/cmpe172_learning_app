import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<Signup>
{
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool processing = false;

  void signup() async
  {
    setState(() {
      processing = true;
    });
    var url = "https://undrunk-surveyor.000webhostapp.com/cmpe172/signuup.php";
    var response = await http.post(Uri.parse(url), body: {
      "Email": email.text,
      "Password": pass.text,
    });
    var data = await json.decode(json.encode(response.body));
    if (data == "account already exists") {
      Fluttertoast.showToast(msg: 'User already exist, please login');
      }
    else
      {
        if (data == "true")
          {
            Fluttertoast.showToast(msg: 'Account created successfully');
          }
        else
          {
            Fluttertoast.showToast(msg: 'Error');
          }
      }
    setState(() {
      processing = true;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
          IconButton( onPressed: ()
          {
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back_ios, size:20, color: Colors.black,)),
      ),
      body: SafeArea (
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text ("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
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
                        padding: const EdgeInsets.only(top:3, left:3),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: const Border(
                          bottom: BorderSide(color:Colors.black),
                          top: BorderSide(color:Colors.black),
                          right: BorderSide(color:Colors.black),
                          left: BorderSide(color:Colors.black)
                        )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () => signup(),
                        color: Colors.green[500],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: processing == false ? const Text("Sign Up", style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16,
                        ),) : const CircularProgressIndicator(backgroundColor: Colors.green,)
                      ),
                    ),
                   ),
                   const SizedBox(height: 20,),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Already have an account? "),
                          Text("Login", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),),
                        ],
                      )
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
