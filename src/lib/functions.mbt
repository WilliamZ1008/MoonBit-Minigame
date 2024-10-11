pub fn collision_check(pos: Position, fruit_pos: Position) -> Bool {
  if pos.x < fruit_pos.x + 5 && pos.x + 8 > fruit_pos.x && pos.y < fruit_pos.y + 5 && pos.y + 8 > fruit_pos.y {
    true
  } else {
    false
  }
}