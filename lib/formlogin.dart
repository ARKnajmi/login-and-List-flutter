import 'package:flutter/material.dart';
import 'package:lab_2_pm/listproduct.dart';


class formLogin extends StatefulWidget {
  const formLogin({super.key});

  @override
  State<formLogin> createState() => _formLoginState();
}

class _formLoginState extends State<formLogin> {
  late Color myColor;
  late Size medSize;
  final _formkey =GlobalKey<FormState>();
  TextEditingController _pw = TextEditingController();
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    medSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(image: AssetImage('assets/images/jeremy-bishop-8xznAGy4HcY-unsplashlow.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(myColor.withOpacity(0.5), BlendMode.dstATop)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
          Positioned(top:150, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom())
          ]),
      ),
    );
  }

  Widget _buildTop(){
    return SizedBox(
      width: medSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.waving_hand_outlined,
            size: 90,
            color: Colors.white,
          ),
          SizedBox(height: 20,),
          Text("Hello There!, Welcome to My App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: medSize.width,
      child: Card(shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildForm(),
          ),
      ),
    );
  }

  Widget _buildForm(){
    return Form(
      key: _formkey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Login Here",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: myColor,
          fontSize: 32,
          fontWeight: FontWeight.w500,
          
        ),
        ),
        // _customText("Silahkan Login"),
         SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Your Username",
                labelText: "Username (isi random)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                  )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            
            SizedBox(height: 25,),
            TextFormField(
              controller: _pw,
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: "Your Password",
                labelText: "Password (isi random)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                  ),
                suffixIcon: IconButton(
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),

            SizedBox(height: 15,),
            Row(
            children: [
              GestureDetector(
                onTap: () {},
            child: _customText("Forgot password?")
              )
            ],
          ),

            SizedBox(height: 22,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: myColor,
                minimumSize: Size.fromHeight(50)
              ),
              onPressed: (){
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => listProduct()),
                  );
                }else{
                  print("You need to fill the field above!");
                }
                // Navigasi ke SecondPage saat tombol ditekan
                
              }, child: Text('Login')),

              SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _customText2("Don't have an account?   "),
                  GestureDetector(
                    onTap: () {},
                    child: _customText("Sign up")
              )
                ],
               )
      ],), 
    );
  }

  Widget _customText(String text){
    return Text(
      text,
      style: const TextStyle(

        color: Color.fromARGB(255, 58, 58, 58),fontSize: 15,
        decoration: TextDecoration.underline
      ),
    );
  }
  Widget _customText2(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,fontSize: 13,
      ),
    );
  }
}


