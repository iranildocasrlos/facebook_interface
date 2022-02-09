import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface_aula/compoments/imagem_perfil.dart';
import 'package:facebook_interface_aula/data/dados.dart';
import 'package:facebook_interface_aula/models/models.dart';
import 'package:facebook_interface_aula/utils/paleta_cores.dart';
import 'package:flutter/material.dart';


class AreaStory extends StatelessWidget {

 final Usuario usuario;
 final List<Story> story;


  const AreaStory({
   Key? key,
   required this.usuario,
   required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 200,
     color: Colors.grey[200],
     child: ListView.builder(
       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        scrollDirection: Axis.horizontal,
         itemCount: 1 + story.length,
         itemBuilder: (context, indice){

         if(indice == 0){
           Story userStory = Story(
               usuario: usuarioAtual,
               urlImagem: usuarioAtual.urlImagem);


           return Padding(
             padding: EdgeInsets.symmetric(horizontal: 4),
             child: CardStory(
               addStory: true,
               estoria: userStory,
             ),
           );
         }

          Story estoria = story[indice -1 ];

              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                child: CardStory(
                  estoria: estoria,
                ),
              );
         }),

    );
  }
}

class CardStory extends StatelessWidget {

  final Story estoria;
  final bool addStory;

  const CardStory({
    Key? key,
   this.addStory = false,
    required this.estoria
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeEStoria,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
            child: addStory
            ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: PaletaCores.azulFacebook,
                      onPressed: (){},
                    ),
            )
            : Imagemperfil(urlImagem: estoria.usuario.urlImagem,
            foiVisualizado: estoria.foiVisualizado,)
        ),
        Positioned(
          bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              addStory ? "Criar Story" :estoria.usuario.nome,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
        )
      ],
    );
  }
}


