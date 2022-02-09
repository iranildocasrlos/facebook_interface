import 'package:facebook_interface_aula/models/models.dart';

class Story{


  Usuario usuario;
  String urlImagem;
  bool foiVisualizado;

  Story({
    required this.usuario,
    required this.urlImagem,
    this.foiVisualizado = false,});

}