import 'package:clean_getx/src/contracts/domain/entity.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Model<T extends Entity> {
  T toEntity();

  Map<String, dynamic> toJson();
}
