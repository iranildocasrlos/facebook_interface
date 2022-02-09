import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface_aula/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class Imagemperfil extends StatelessWidget {
  final String urlImagem;
  final bool foiVisualizado;


  const Imagemperfil({
    Key? key,
    required this.urlImagem,
    this.foiVisualizado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: PaletaCores.azulFacebook,
      radius: 20,
      child: CircleAvatar(
        radius: 17,
        backgroundImage: CachedNetworkImageProvider(urlImagem),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
