let pos : Position = { x : 72, y : 90}
let turn : Turn = { value : false}
let game : Game = Game::new()

let random : @random.Rand = @random.Rand::new()

let harvest_tone : Tone = Tone::new((262, 0), @wasm4.ADSR::new(10), @wasm4.ADSRVolume::new(10), @wasm4.ToneFlag::new(channel=@wasm4.ToneChannel::Pulse1, mode=@wasm4.ToneMode::Duty_1_8))

pub fn start() -> Unit {
  @wasm4.set_draw_colors(index=1, 2)



}

pub fn update() -> Unit {
  play_music(game.frame_count)

  if @wasm4.get_gamepad(index=1).button_right && pos.x < 152 {
    turn.value = true
    pos.x += 1
  } else if @wasm4.get_gamepad(index=1).button_left && pos.x >= 1 {
    turn.value = false
    pos.x -= 1
  }
  
  if @wasm4.get_gamepad(index=1).button_up && pos.y >= 1 {
    pos.y -= 1
  } else if @wasm4.get_gamepad(index=1).button_down && pos.y < 152 {
    pos.y += 1
  }

  @wasm4.text("Score: " + game.score.to_string(), 0, 0)

  if game.frame_count % 60 == 0 && game.fruits.length() < game.max_fruits {
      game.fruits.push({x: random.int(limit=155), y: 20})
  }

  for i = 0; i < game.fruits.length(); i = i + 1 {
    if collision_check(pos, game.fruits[i]) {
      @wasm4.tone(harvest_tone.frequency, harvest_tone.adsr, harvest_tone.volume, harvest_tone.flags)
      game.score += 1
      ignore(game.fruits.remove(i))
      continue
    }

    game.fruits[i].y += 1
    if game.fruits[i].y > 135 {
      game.fruits[i].x = random.int(limit=155)
      game.fruits[i].y = 20
    }
    @wasm4.oval(game.fruits[i].x, game.fruits[i].y, 5, 5)
  }

  @wasm4.blit(smiley_sprite, pos.x, pos.y, 8, 8, {one_bit_per_pixel: false, flip_x: false, flip_y: turn.value, rotate: true})

  game.frame_count += 1
}