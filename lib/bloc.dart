import 'package:rxdart/rxdart.dart';

class Bloc {
  Bloc() {
    loadData();
  }

  final BehaviorSubject<String> _name = BehaviorSubject<String>();

  Function(String) get changeName => _name.sink.add;

  Stream<String> get name => _name.stream;

  Future<void> loadData() async {
    // Simulando carga desde la red.
    await Future.delayed(Duration(milliseconds: 1100));
    _name.sink.add('Jonatan');
  }

  void dispose() {
    _name.close();
  }
}