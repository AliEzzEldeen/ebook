import 'package:hive/hive.dart';

import '../../../constants.dart';
import '../../../features/home/domain/entities/book_entitiy.dart';

void saveBooksData(List<BookEntity> books ,String boxName)
{
  var box = Hive.box(kFeaturedBox);
  box.addAll(books);

}