import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_app/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return new HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
        bloc: widget._homeBloc,
        builder: (
          BuildContext context,
          HomeState currentState,
        ) {
          if (currentState is UnHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeState) {
            return new Container(
              child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error' ),
            ));
          }
          return Material(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffd399c1),
                            Color(0xff9b5acf),
                            Color(0xff611cdf),
                          ]
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(26),
                          bottomRight: Radius.circular(26)
                        )
                      ),
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Text("Stack Overflow"),
                      centerTitle: true,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: 25,
                      right: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        "Hi, \nWelcome to Stack Overflow questions app",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 22
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('All Questions', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,i){
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueGrey,
                          child: Text("p")
                        ),
                        title: Text("akj,mzxckjbs,mclkjkshad aksjd laksdai jnln, sd"),
                        trailing: Chip(
                          backgroundColor: Color(0xffd399c1),
                              label: Text(
                                "2 Views",
                                style: TextStyle(
                                  color: Colors.white,

                                ),
                                ),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Chip(
                              backgroundColor: Color(0xff9b5acf),
                              label: Text(
                                "Python",
                                style: TextStyle(
                                  color: Colors.white,

                                ),
                                ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
