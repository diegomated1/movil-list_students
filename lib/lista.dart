import 'package:flutter/material.dart';
import 'package:list_students/StudentsNotifier.dart';
import 'package:list_students/tarjeta.dart';
import 'package:provider/provider.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});
  
  @override
  Widget build(BuildContext context) {

    var std = context.watch<StudentsNotifier>();
    
    return Scaffold(
      body: Container(
        color: getColor(),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: FutureBuilder(
          future: std.students,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.students.length,
                itemBuilder: (BuildContext context, int index){
                  return Tarjeta(
                    id: snapshot.data!.students[index].id,
                    fullname: snapshot.data!.students[index].fullname,
                    carrera: snapshot.data!.students[index].carrera,
                    promedio: snapshot.data!.students[index].promedio.toString()
                  );
                },
              );
            }else{
              return ListView(
                children: const [
                  Tarjeta(
                    id: '1', 
                    fullname: 'Diego Cardenas',
                    carrera: 'Ing. Sistemas e Informatica cuatro',
                    promedio: '3.0'
                  ),
                ],
              ); 
            }
          }),
        )
        
    );
  }
}