class Post{
  int id;
  String name;
  String salary;
  String age;
  Post({required this.name,required this.salary,required this.age,required this.id});
  Post.toJson( Map<String,dynamic> json)
  :name=json['name'],
  id=json['id'],
  salary=json['salary'],
  age=json['age'];
  Map<String,dynamic> fromJson()=>{
    'name':name,
    'id':id,
    'salary':salary,
    'age':age,
  };
}
