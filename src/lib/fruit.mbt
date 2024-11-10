// 变量和初始化部分
let random : @random.Rand = @random.Rand::new()
let harvest_tone : Tone = Tone::new((262, 0), @wasm4.ADSR::new(10), @wasm4.ADSRVolume::new(10), @wasm4.ToneFlag::new(channel=@wasm4.ToneChannel::Pulse1, mode=@wasm4.ToneMode::Duty_1_8))

// 随机水果
pub fn random_fruit(pos: Position, game: Game)  -> Unit{
  // 生成随机水果
  if game.frame_count % 60 == 0 && game.fruits.length() < game.max_fruits {
      game.fruits.push({x: random.int(limit=155), y: 20})
  }

  // 检查水果和角色的碰撞
  for i = 0; i < game.fruits.length(); i = i + 1 {
    if collision_check(pos, game.fruits[i]) {
      @wasm4.tone(harvest_tone.frequency, harvest_tone.adsr, harvest_tone.volume, harvest_tone.flags)
      game.score += 1
      ignore(game.fruits.remove(i))
      continue
    }

    game.fruits[i].y += game.egg_speed
    if game.fruits[i].y > 135 {
      game.fruits[i].x = random.int(limit=155)
      game.fruits[i].y = 20
    }
    @wasm4.oval(game.fruits[i].x, game.fruits[i].y, 5, 5)
  }
}