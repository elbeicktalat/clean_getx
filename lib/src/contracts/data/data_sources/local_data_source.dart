import 'package:clean_getx/src/contracts/data/data_sources/data_source.dart';
import 'package:clean_getx/src/contracts/domain/entity.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource<E extends Entity> extends DataSource<E> {
  @protected
  SharedPreferences get preferences => GetInstance().find<SharedPreferences>();
}
