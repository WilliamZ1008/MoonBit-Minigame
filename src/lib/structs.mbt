pub struct Position {
  mut x: Int
  mut y: Int
}

pub struct Turn {
  mut value: Bool
}

pub struct Game {
  max_fruits: Int
  mut frame_count: UInt
  mut fruits: Array[Position]
  mut score: Int
  mut state: GameState
  mut level: Int
  mut clearance_score: Int
  mut level_max_frame_count: UInt
  mut egg_speed: Int
  mut sprite_speed: Int
}

pub enum GameState {
  Intro
  Playing
  Win
  Lose
}

pub fn Game::new() -> Game {
  {
    max_fruits: 10,
    frame_count: 0U,
    fruits: [],
    score: 0,
    state: GameState::Intro,
    level: 0,
    clearance_score: 10,
    level_max_frame_count: 1000U,
    egg_speed: 1,
    sprite_speed: 1
  }
}

pub struct MusicInfo {
  mut note_i : Int
  mut offset : UInt
}

pub fn MusicInfo::new() -> MusicInfo {
  {
    note_i: 0,
    offset: 0U
  }
}

pub struct Tone {
  frequency: (UInt, UInt)
  adsr: @wasm4.ADSR
  volume: @wasm4.ADSRVolume
  flags: @wasm4.ToneFlag
}

pub fn Tone::new(frequency : (UInt, UInt), adsr : @wasm4.ADSR, volume : @wasm4.ADSRVolume, flags : @wasm4.ToneFlag) -> Tone {
  {
    frequency: frequency,
    adsr: adsr,
    volume: volume,
    flags: flags
  }
}