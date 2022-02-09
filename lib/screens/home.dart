import 'package:facebook_interface_aula/compoments/aera_story.dart';
import 'package:facebook_interface_aula/compoments/area_criar_postagem.dart';
import 'package:facebook_interface_aula/compoments/botao_circulo.dart';
import 'package:facebook_interface_aula/models/cartao_postagem.dart';
import 'package:facebook_interface_aula/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:facebook_interface_aula/models/models.dart';
import 'package:facebook_interface_aula/data/dados.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            backgroundColor: Colors.white,
           // expandedHeight: 250,
            floating: true,
            centerTitle: false,
            title: Text("Fakebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
              ),
            ),

            actions: [
              BotaoCirculo(
                icone: LineIcons.search,
                iconeTamanho: 30,
                onPressed: (){},
              ),

              BotaoCirculo(
                       icone: LineIcons.facebookMessenger,
                       iconeTamanho: 30,
                       onPressed: (){},

                     ),
            ],
          ),

          SliverToBoxAdapter(
            child: AreaCriarPostagem(
              usuario: usuarioAtual,
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaStory(
                usuario: usuarioAtual,
                story: story,
              ),
            ),
          ),
          

          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, indice){
                    Postagem postagem = postagens[indice];
                    return CartaoPostagem(
                        postagem: postagem
                    );
                  },
                childCount:  postagens.length
              )
          ),
        ],
      ),
    );
  }
}
