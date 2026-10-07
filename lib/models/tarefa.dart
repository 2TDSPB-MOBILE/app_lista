class Tarefa {
  Tarefa({required this.titulo,required this.dateTime});
  //Construtor nomeado
  Tarefa.fromJson(Map<String,dynamic>json)
    :titulo = json["titulo"],
     dateTime = DateTime.parse(json["dateTime"]);

  String titulo;
  DateTime dateTime;

  //Conveter o objeto Tarefa para um Map.
  //Estou convertento para map para depois transformar JSON
  Map<String,dynamic>toJson(){
    return {
      "titulo":titulo,
      "dateTime":dateTime.toIso8601String()
    };
  }
}