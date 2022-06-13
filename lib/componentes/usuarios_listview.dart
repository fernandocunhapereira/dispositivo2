import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:un2projeto/controller/usuariocontroller.dart';
import 'package:un2projeto/utils/app_routes.dart';

import '../models/usuario.dart';

class UsuarioListView extends StatefulWidget {
  const UsuarioListView({Key? key}) : super(key: key);

  @override
  State<UsuarioListView> createState() => _UsuarioListViewState();
}

class _UsuarioListViewState extends State<UsuarioListView> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<UsuarioController>(context);
    //final _controller = context.watch<UsuarioController>();

    _controller.start();

    return ListView.builder(
      itemCount: _controller.usuarios.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text('${_controller.usuarios[index].id}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              title: Text(_controller.usuarios[index].nome,
                style: TextStyle(
                  //color:Colors.white,
                  color:Colors.black,
                )
              ),
              subtitle: Text(_controller.usuarios[index].email),

              trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          updateCliente(_controller.usuarios[index]);
                        },
                        icon: const Icon(Icons.edit),
                        //color: Colors.orange,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      IconButton(
                        onPressed: () {
                          _controller
                              .deleteUsuario(_controller.usuarios[index]);
                        },
                        icon: const Icon(Icons.delete),
                        color: Color.fromARGB(255, 183, 31, 20),
                        //color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  )),
              // onTap: () {
              //   setState(() {
              //     _usuario = globals.listaUsuariosGlobal[index];
              //   });
              // },
            ),
          ],
        );
      },
    );
  }

  void updateCliente(Usuario usuario) {
    Navigator.of(context).pushNamed(AppRoutes.USUARIO_FORM, arguments: usuario);
  }
}
