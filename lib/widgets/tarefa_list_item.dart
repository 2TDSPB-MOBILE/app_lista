import 'package:flutter/material.dart';
import 'package:app_lista/models/tarefa.dart';

class TarefaListItem extends StatelessWidget {
  const TarefaListItem({super.key,required this.tarefa});

  final Tarefa tarefa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[200]
        ),      
        padding: EdgeInsets.all(10),
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarefa.titulo,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight(600)),
            ),
            Text(tarefa.dateTime.toString(),
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}