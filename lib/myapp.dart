import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un2projeto/componentes/usuario_form.dart';
import 'package:un2projeto/controller/usuariocontroller.dart';
import 'package:un2projeto/pages/home_page.dart';
import 'package:un2projeto/pages/usuario_page.dart';

import 'pages/login_page.dart';
import 'utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsuarioController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciador de Projetos',
        theme: ThemeData(
            colorScheme: ThemeData().colorScheme.copyWith(
                primary: const Color.fromARGB(255, 80, 29, 161),
                secondary: const Color.fromARGB(255, 245, 245, 48)),
            //primarySwatch: Colors.purple,
            //accentColor: Colors.amber,
            fontFamily: 'Raleway',
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ))),
        initialRoute: '/',
        // home: const LoginPage(),
        routes: {
          AppRoutes.LOGIN: (ctx) => const LoginPage(),
          AppRoutes.HOME: (ctx) => const HomePage(),
          AppRoutes.USUARIO_PAGE: (ctx) => const UsuarioPage(),
          AppRoutes.USUARIO_FORM: (ctx) => UsuarioForm(),

          // AppRoutes.PROJETO_DETALHE: (ctx) => ProjetoDetalheScreen(),
          // AppRoutes.PROJETO_CADASTRO: (ctx) => ProjetoCadastroScreen(),
          // AppRoutes.TAREFA_CADASTRO: (ctx) => TarefaCadastroScreen(),
        },
      ),
    );
  }
}
