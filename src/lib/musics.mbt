let music : Array[(UInt, UInt)] = [(0, 349), (47, 391), (48, 415), (48, 311), (48, 277), (0, 69), (23, 103), (48, 138), (48, 155), (48, 415), (0, 174), (48, 391), (48, 349), (48, 311), (48, 261), (0, 77), (24, 116), (48, 155), (48, 174), (48, 415), (0, 195)]
let music_info : MusicInfo = MusicInfo::new()

pub fn play_music(frame_count : UInt) -> Unit {
  @wasm4.text((music_info.offset + music[music_info.note_i].0 - frame_count).to_string(), 0, 100)
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