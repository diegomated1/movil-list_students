library student;

class Student {
  Student({
    required this.id,
    required this.fullname,
    required this.carrera,
    required this.promedio,
  });
  
  final String id;
  final String fullname;
  final String carrera;
  final double promedio;

  factory Student.fromJson(Map<String, dynamic> json){
    return Student(
      id: json['id'],
      fullname: json['fullname'],
      carrera: json['carrera'],
      promedio: double.parse(json['promedio'].toString()),
    );
  }
}

class Students {
  Students({required this.students});

  final List<Student> students;
  
  factory Students.fromJson(List<dynamic> json){
    List<Student> lista = json.map((student) => Student.fromJson(student)).toList();
    return Students(students: lista);
  }
}
