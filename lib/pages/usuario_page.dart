import 'package:flutter/material.dart';
import 'package:un2projeto/componentes/usuarios_listview.dart';
import 'package:un2projeto/controller/usuariocontroller.dart';
import '../models/usuario.dart';
import '../utils/app_routes.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({Key? key}) : super(key: key);

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final _usuarioControllerNome = TextEditingController();
  final _usuarioControllerEmail = TextEditingController();

  final _controller = UsuarioController();

  //final provider = Provider.of<Usu>(context);
  int count = 0;

  _success() {
    return const UsuarioListView();
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _error() {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        _controller.start();
      },
      child: const Text('Tentar Novamente'),
    ));
  }

  GerenciaEstado(UsuarioState state) {
    switch (state) {
      case UsuarioState.success:
        return _success();
      case UsuarioState.loading:
        return _loading();
      case UsuarioState.error:
        return _error();
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    //final projeto = ModalRoute.of(context)!.settings.arguments as Projeto;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        actions: [
          IconButton(
              onPressed: () {
                novoUsuario();
              },
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: Column(
        children: <Widget>[
          // Card(
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //   elevation: 4,
          //   margin: const EdgeInsets.all(10),
          //   color: const Color.fromARGB(255, 238, 229, 248),
          //   child: Column(children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: TextField(
          //         controller: _usuarioControllerNome,
          //         decoration: const InputDecoration(
          //           labelText: 'Nome',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: TextField(
          //         controller: _usuarioControllerEmail,
          //         decoration: const InputDecoration(
          //           labelText: 'Email',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //   ]),
          // ),
          // const Divider(
          //   height: 20,
          // ),
          // ElevatedButton(
          //     onPressed: salvarUsuario,
          //     child: const Text(
          //       'Salvar',
          //     )),
          Expanded(
              child: AnimatedBuilder(
            animation: _controller.state,
            builder: (context, child) {
              return GerenciaEstado(_controller.state.value);
            },
          ))
        ],
      ),
    );
  }

  salvarUsuario() {
    Usuario novoUsuario = Usuario(
        id: 0,
        nome: _usuarioControllerNome.text,
        email: _usuarioControllerEmail.text);
    _controller.addUsuario(novoUsuario);
    //Navigator.pop(context, novoUsuario);
  }

  void novoUsuario() {
    final usuario = Usuario(id: 0, nome: "", email: "");
    Navigator.of(context).pushNamed(AppRoutes.USUARIO_FORM, arguments: usuario);
  }
}
