import 'package:flutter/material.dart';
import 'package:un2projeto/utils/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userControllerEmail = TextEditingController();
  final _userControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          Color.fromARGB(255, 255, 255, 255), 
          Color.fromARGB(255, 60, 210, 223)
          ],
          //begin: const FractionalOffset(0.0, 0.0),
          //end: const FractionalOffset(1.0, 0.0),
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/icone_login.png',width: 100, height: 100, fit: BoxFit.cover,),

            Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 4,
              margin: const EdgeInsets.all(20),
              //color: const Color.fromARGB(255, 238, 229, 248), //cor original
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField( //FORMATAR EMAIL AQUI********* ********
                    keyboardType: TextInputType.emailAddress,
                    controller: _userControllerEmail,
                    decoration:const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                          child: Icon(
                            Icons.email,
                          ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: _userControllerPassword,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                          child: Icon(
                            Icons.key,
                          ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const Divider(
              height: 20,
            ),
            LoginButton(
                userControllerEmail: _userControllerEmail,
                userControllerPassword: _userControllerPassword
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required TextEditingController userControllerEmail,
    required TextEditingController userControllerPassword,
  })  : _userControllerEmail = userControllerEmail,
        _userControllerPassword = userControllerPassword,
        super(key: key);

  final TextEditingController _userControllerEmail;
  final TextEditingController _userControllerPassword;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )
        )
      ),
        onPressed: () {
          if ( //_userControllerEmail.text == 'ipojuca@email.com.br' &&
              _userControllerPassword.text == '123') {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  padding: EdgeInsets.all(8.0),
                  content: Text('Usuário ou senha invalido!')),
            );
          }
        },
        child: const Text(
          'Entrar no App',
        ));
  }
}
