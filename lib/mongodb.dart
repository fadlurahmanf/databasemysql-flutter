import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start()async{
  final db = await Db.create('mongodb+srv://firstdatabase:firstdatabase@cluster0.jhfhp.mongodb.net/<dbname>?retryWrites=true&w=majority');
  await db.open();
  final col = db.collection('contact');
  print(await col.find().toList());
  print('hello');
}