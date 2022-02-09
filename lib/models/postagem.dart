import 'package:facebook_interface_aula/models/models.dart';

class Postagem{
        Usuario usuario;
        String descricao;
        String tempoAtras;
        String urlImagem;
        int curtidas;
        int comentarios;
        int compartilhamentos;

          Postagem({
            required this.usuario,
            required this.descricao,
            required this.tempoAtras,
            required this.urlImagem,
            required this.comentarios,
            required this.curtidas,
            required this.compartilhamentos,


        });



}