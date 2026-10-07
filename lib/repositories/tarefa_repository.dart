import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_lista/models/tarefa.dart';
import 'dart:convert';

const tarefaListKey = "lista_tarefas";

class TarefaRepository {
  TarefaRepository(){
    SharedPreferences.getInstance().then((value)=>sharedPreferences=value);
  }

  late SharedPreferences sharedPreferences;

  void saveListaTarefas(List<Tarefa>tarefas){
    final jsonString  = json.encode(tarefas);
    sharedPreferences.setString(tarefaListKey, jsonString);
  }

  Future<List<Tarefa>>getListaTarefas()async{
    sharedPreferences = await SharedPreferences.getInstance();
    
    final String jsonString = sharedPreferences.getString(tarefaListKey)??"[]";
    final List jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded.map((e)=>Tarefa.fromJson(e)).toList();
  }
}