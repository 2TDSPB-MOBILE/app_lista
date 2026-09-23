import 'package:flutter/material.dart';
import 'package:app_lista/models/tarefa.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TarefaListItem extends StatelessWidget {
  const TarefaListItem({super.key, required this.tarefa,required this.onDelete});

  final Tarefa tarefa;
  final Function(Tarefa) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (context) {
                onDelete(tarefa);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: "Excluir",
            )
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
          
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tarefa.titulo,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight(600)),
                ),
                Text(
                  DateFormat("dd/MM/yyyy - HH:mm").format(tarefa.dateTime),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}