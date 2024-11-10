// 检测按键移动 kunkun
pub fn move_kunkun(pos: Position, turn: Turn, game: Game) -> Unit {
  if @wasm4.get_gamepad(index=1).button_2 {
    game.sprite_speed = 2
  } else {
    game.sprite_speed = 1
  }

  if @wasm4.get_gamepad(index=1).button_right && pos.x < 152 {
    turn.value = true
    pos.x += game.sprite_speed
  } else if @wasm4.get_gamepad(index=1).button_left && pos.x >= 1 {
    turn.value = false
    pos.x -= game.sprite_speed
  }

  if @wasm4.get_gamepad(index=1).button_up && pos.y >= 1 {
    pos.y -= game.sprite_speed
  } else if @wasm4.get_gamepad(index=1).button_down && pos.y < 152 {
    pos.y += game.sprite_speed
  }
}

pub fn collision_check(pos: Position, fruit_pos: Position) -> Bool {
  if pos.x < fruit_pos.x + 5 && pos.x + 8 > fruit_pos.x && pos.y < fruit_pos.y + 5 && pos.y + 8 > fruit_pos.y {
    true
  } else {
    false
  }
}