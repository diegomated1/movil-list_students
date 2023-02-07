library tarjeta;

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Color getColor({double opa = 0.2}){
  Random rd = Random();
  return Color.fromRGBO(rd.nextInt(255), rd.nextInt(255), rd.nextInt(255), opa);
}

class Tarjeta extends StatefulWidget{
  const Tarjeta({
    super.key,
    required this.id,
    required this.fullname,
    required this.carrera,
    required this.promedio
  });
  
  final String id;
  final String fullname;
  final String carrera;
  final String promedio;

  @override
  State<StatefulWidget> createState() => _Tarjeta();
}

class _Tarjeta extends State<Tarjeta>{

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: (width >= 380) ? 150 : (width*150)/380,
        child: Center(
          child: 
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5.0,
                )
              ]
            ),
            width: 360,
            height: (width >= 380) ? 120 : (width*120)/380,
            child: Row(
              children: [
                Expanded(
                  //width: 120,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Photo(id: widget.id,),
                  )
                ),
                Expanded(
                  flex: 2,
                  //width: 240,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Info(title: 'Nombre completo', text: widget.fullname),
                          const Divider(height: 0.5, thickness: 1,),
                          Info(title: 'Carrera', text: widget.carrera),
                          const Divider(height: 0.5, thickness: 1,),
                          Info(title: 'Promedio', text: widget.promedio),
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}


class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.id
  });

  final String id;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    String url = '${dotenv.get("API_HOST", fallback: "")}/images';

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 4.0,
            offset: Offset(0.0, 0.75)
          )
        ],
        color: Color.fromARGB(255, 234, 234, 234),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: 
        CachedNetworkImage(
          imageUrl: '$url/$id',
          fit: BoxFit.fill,
          errorWidget: ((context, url, error) {
            return Container(
              color: getColor(),
              child: Icon(
                Icons.person,
                size: (width >= 380) ? 90 : (width*90)/380,
              ),
            );
          }),
        )
      )
    );
  }
  
}


class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.text
  });

  final String title;
  final String text;
  
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 6.0, left: 5.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: (width >= 380) ? 8 : (width*8)/380,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: (width >= 380) ? 15 : (width*15)/380
                ),
              )
            ),
          ],
        )
      )
    ); 
  }

}