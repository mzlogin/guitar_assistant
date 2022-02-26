import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '吉他助手',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '吉他助手'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // X 分音符为一拍，默认 4
  int _oneBeat = 4;
  // 每小节 X 拍，默认 4
  int _beatsPerMeasure = 4;
  // 每分钟多少拍，默认 60
  int _beatsPerMinute = 60;
  // 是否正在播放节拍器音频
  bool _isPlaying = false;
  // 当前计数
  int _currentStep = -1;

  late AnimationController _animationController;
  Timer? _timer;

  final AudioCache _audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
    ..duration = const Duration(milliseconds: 500);
  }

  _renewTimer() {
    _timer = Timer(Duration(milliseconds: (60 * 1000 ~/ _beatsPerMinute)), () {
      _playAudio().then((value) => _incrementCurrentStep);
      _renewTimer();
    });
  }

  Future<void> _playAudio() {
    int nextStep = _currentStep + 1;
    if (nextStep % _beatsPerMeasure == 0) {
      return _audioCache.play('sound-effect-1_1.wav');
    } else {
      return _audioCache.play('sound-effect-1_2.wav');
    }
  }

  _switchPlayingState() {
    if (_isPlaying) {
      _animationController.reverse();
      _timer?.cancel();
    } else {
      _animationController.forward();
      _renewTimer();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  _incrementCurrentStep() {
    setState(() {
      _currentStep++;
    });
  }

  _incrementOneBeat() {
    if (_oneBeat >= 16) {
      return;
    }
    setState(() {
      _oneBeat *= 2;
    });
  }

  _decrementOneBeat() {
    if (_oneBeat <= 1) {
      return;
    }
    setState(() {
      _oneBeat = _oneBeat ~/ 2;
    });
  }

  _incrementBeatsPerMeasure() {
    if (_beatsPerMeasure >= 20) {
      return;
    }
    setState(() {
      _beatsPerMeasure++;
    });
  }

  _decrementBeatsPerMeasure() {
    if (_beatsPerMeasure <= 1) {
      return;
    }
    setState(() {
      _beatsPerMeasure--;
    });
  }

  _incrementBeatsPerMinute() {
    if (_beatsPerMinute >= 500) {
      return;
    }
    setState(() {
      _beatsPerMinute++;
    });
  }

  _decrementBeatsPerMinute() {
    if (_beatsPerMinute <= 20) {
      return;
    }
    setState(() {
      _beatsPerMinute--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: _decrementBeatsPerMinute, icon: const Icon(Icons.remove)),
              Text('$_beatsPerMinute'),
              IconButton(onPressed: _incrementBeatsPerMinute, icon: const Icon(Icons.add)),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: _decrementBeatsPerMeasure, icon: const Icon(Icons.remove_circle)),
              IconButton(onPressed: _incrementBeatsPerMeasure, icon: const Icon(Icons.add_circle)),
              Text('$_beatsPerMeasure / $_oneBeat'),
              IconButton(onPressed: _decrementOneBeat, icon: const Icon(Icons.remove_circle)),
              IconButton(onPressed: _incrementOneBeat, icon: const Icon(Icons.add_circle)),
            ],
          ),
          InkWell(
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animationController,
            ),
            onTap: _switchPlayingState,
          )
        ]
      )
    );
  }
}
