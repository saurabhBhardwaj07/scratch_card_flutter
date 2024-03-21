import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_card/bloc/home_bloc/home_bloc.dart';
import 'package:scratch_card/core/app_exports.dart';

class AutoPickNumber extends StatefulWidget {
  const AutoPickNumber({super.key});

  @override
  State<AutoPickNumber> createState() => _AutoPickNumberState();
}

class _AutoPickNumberState extends State<AutoPickNumber> {
  late StreamController<int> _streamController;
  late Random _random;
  late int _lastRandomNumber;
  bool _isStreamActive = true;

  @override
  void initState() {
    super.initState();
    _random = Random();
    _lastRandomNumber = _random.nextInt(100) + 1;
    _streamController = StreamController<int>();
    _generateRandomNumbers();
    _stopStreamAfterDelay();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void _generateRandomNumbers() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!_isStreamActive) {
        timer.cancel();
        return;
      }
      _lastRandomNumber = _random.nextInt(100) + 1;
      _streamController.sink.add(_lastRandomNumber);
    });
  }

  void _stopStreamAfterDelay() {
    Timer(const Duration(seconds: 5), () {
      _isStreamActive = false;
      _streamController.sink.add(_lastRandomNumber);
      Timer(const Duration(seconds: 2), () {
        BlocProvider.of<HomeBloc>(context)
            .add(HomeBlocAutoPickNumberSubmit(pickedNumber: _lastRandomNumber));
        Navigator.of(context).pop();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        color: Colors.black.withOpacity(0.4),
        child: Container(
            padding: EdgeInsets.only(
                left: 50,
                right: 50,
                top: size.height * 0.26,
                bottom: size.width * 0.08),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary, shape: BoxShape.circle),
                  child: StreamBuilder<int>(
                    stream: _streamController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.toString(),
                          style: const TextStyle(
                              fontSize: 48, color: Colors.white),
                        );
                      } else {
                        return const CircularProgressIndicator(); // Loading indicator while numbers are being generated
                      }
                    },
                  ),
                )
              ],
            )));
  }
}
