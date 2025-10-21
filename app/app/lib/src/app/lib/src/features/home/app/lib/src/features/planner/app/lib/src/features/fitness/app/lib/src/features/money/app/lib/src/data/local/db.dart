import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get start => dateTime().nullable()();
  DateTimeColumn get end => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get priority => integer().withDefault(const Constant(2))();
  @override
  Set<Column> get primaryKey => {id};
}

class Habits extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get preferredTime => text().nullable()();
  IntColumn get targetPerWeek => integer().withDefault(const Constant(5))();
  @override
  Set<Column> get primaryKey => {id};
}

class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()(); // fitness | income | routine
  TextColumn get outcome => text()();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Tasks, Habits, Goals])
class AppDb extends _$AppDb {
  AppDb() : super(_open());
  @override
  int get schemaVersion => 1;

  Future<void> upsertTask(TasksCompanion t) => into(tasks).insertOnConflictUpdate(t);
  Future<List<Task>> pendingTasks() => (select(tasks)..where((t) => t.status.equals('pending'))).get();
}

LazyDatabase _open() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'life_builder.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
