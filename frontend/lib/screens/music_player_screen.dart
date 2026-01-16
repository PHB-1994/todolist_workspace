import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/music_provider.dart';
import '../widgets/music/album_cover.dart';
import '../widgets/music/equalizer.dart';
import '../widgets/music/lyrics_display.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("🎵 음악 플레이어 "),
        ),
        body: Consumer<MusicProvider>(
          child: const Column(
            // 무거운 위젯들 여기
            children: [
              AlbumCover(),
              LyricsDisplay(),
              Equalizer(),
            ],
          ),
          builder: (context, musicProvider, child) {
            print('builder 실행됨 상태: ???, 진행: ${musicProvider.progress}%');

            return Column(
              children: [
                // 바뀌는 부분들...
                Text(musicProvider.currentSong),
                Icon(musicProvider.isPlaying ? Icons.pause : Icons.play_arrow),

                // 무거운 부분은 재사용
                child!,

                // 컨트롤 버튼들...
              ],
            );
          },
        ));
  }
}
