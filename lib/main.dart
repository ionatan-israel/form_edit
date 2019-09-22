import 'package:flutter/material.dart';
import 'package:form_edit/bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form edit',
      home: Provider<Bloc>(
        builder: (_) => Bloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: Form(),
      ),
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _ctrlName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Form edit'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Consumer<Bloc>(
            builder: (_, bloc, __) {
              return StreamBuilder(
                stream: bloc.name,
                builder: (context, snapshot) {
                  _ctrlName.value =
                      _ctrlName.value.copyWith(text: snapshot.data);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '${snapshot.data}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _ctrlName,
                        onChanged: bloc.changeName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }
}
