import 'package:clean_getx/src/contracts/data/data_sources/data_source.dart';
import 'package:clean_getx/src/contracts/domain/entity.dart';
import 'package:get/instance_manager.dart' show GetInstance;

abstract class RemoteDataSource<E extends Entity, Client>
    extends DataSource<E> {
  Client get client => GetInstance().find<Client>();
}
