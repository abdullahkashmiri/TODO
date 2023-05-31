class Task{
  final int id;
  final String task;
  final DateTime dateTime;

  Task({
    this.id,
    this.task,
    this.dateTime
});
  //now create a function that will turn our data into a Map
Map<String,dynamic> toMap(){
  return(
  {
    'id': id,
    'task': task,
    'creationDate': dateTime:toString()
  }
  );
}
}