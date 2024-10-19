// 检测按键移动 kunkun
pub fn move_kunkun(pos: Position, turn: Turn) -> Unit {
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
}