let music : Array[(UInt, UInt)] = [(0, 349), (47, 391), (48, 415), (48, 311), (48, 277), (0, 69), (23, 103), (48, 138), (48, 155), (48, 415), (0, 174), (48, 391), (48, 349), (48, 311), (48, 261), (0, 77), (24, 116), (48, 155), (48, 174), (48, 415), (0, 195)]
let music_info : MusicInfo = MusicInfo::new()

pub fn play_music(frame_count : UInt) -> Unit {
  //@wasm4.text((music_info.offset + music[music_info.note_i].0 - frame_count).to_string(), 0, 100)
  while music_info.note_i < music.length() && frame_count - music_info.offset == music[music_info.note_i].0 {
    @wasm4.trace((music_info.note_i + 1).to_string() + "/" + music.length().to_string())
    @wasm4.tone((music[music_info.note_i].1, music[music_info.note_i].1), @wasm4.ADSR::new(10), @wasm4.ADSRVolume::new(10), @wasm4.ToneFlag::new())
    music_info.offset += music[music_info.note_i].0
    music_info.note_i += 1
  }

  if music_info.note_i == music.length() {
    music_info.note_i = 0
    music_info.offset = frame_count + 50
  }
}

let kun_music : Array[(UInt, UInt)]  = [(0, 523), (45, 523), (2, 659), (22, 659), (1, 659), (22, 659), (1, 659), (22, 659), (1, 698), (22, 698), (1, 783), (91, 783), (4, 349), (11, 349), (12, 523), (22, 523), (1, 523), (22, 523), (1, 698), (56, 698), (15, 698), (11, 698), (0, 698), (11, 698), (0, 698), (11, 698), (12, 523), (11, 523), (0, 523), (11, 523), (0, 523), (11, 523), (12, 349), (11, 349), (0, 349), (11, 349), (0, 349), (11, 349), (12, 349), (34, 349), (1, 349), (34, 349), (1, 349), (22, 349), (1, 349), (11, 349), (12, 523), (22, 523), (1, 523), (22, 523), (1, 698), (56, 698), (15, 698), (11, 698), (0, 698), (11, 698), (0, 698), (11, 698), (12, 523), (11, 523), (0, 523), (11, 523), (0, 523), (11, 523), (12, 349), (11, 349), (0, 349), (11, 349), (0, 349), (11, 349), (12, 349), (34, 349), (1, 349), (34, 349), (1, 349), (22, 349), (1, 349), (11, 349), (12, 523), (22, 523), (1, 523), (22, 523), (1, 466), (56, 466), (15, 698), (11, 698), (0, 698), (11, 698), (0, 698), (11, 698), (12, 523), (11, 523), (0, 523), (11, 523), (0, 523), (11, 523), (12, 466), (11, 466), (0, 466), (11, 466), (24, 466), (11, 466), (36, 349), (11, 349), (12, 523), (22, 523), (1, 523), (22, 523), (1, 698), (56, 698)]
let kun_music_info : MusicInfo = MusicInfo::new()

pub fn play_kun_music(frame_count : UInt) -> Unit {
  //@wasm4.text((kun_music_info.offset + kun_music[kun_music_info.note_i].0 - frame_count).to_string(), 0, 100)
  while kun_music_info.note_i < kun_music.length() && frame_count - kun_music_info.offset == kun_music[kun_music_info.note_i].0 {
    @wasm4.trace((kun_music_info.note_i + 1).to_string() + "/" + kun_music.length().to_string())
    @wasm4.tone((kun_music[kun_music_info.note_i].1, kun_music[kun_music_info.note_i].1), @wasm4.ADSR::new(10), @wasm4.ADSRVolume::new(10), @wasm4.ToneFlag::new())
    kun_music_info.offset += kun_music[kun_music_info.note_i].0
    kun_music_info.note_i += 1
  }

  if kun_music_info.note_i == kun_music.length() {
    kun_music_info.note_i = 0
    kun_music_info.offset = frame_count + 50
  }
}