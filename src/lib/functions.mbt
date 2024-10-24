pub fn collision_check(pos: Position, fruit_pos: Position) -> Bool {
  if pos.x < fruit_pos.x + 5 && pos.x + 8 > fruit_pos.x && pos.y < fruit_pos.y + 5 && pos.y + 8 > fruit_pos.y {
    true
  } else {
    false
  }
}

/// 按照游戏帧数获取坤坤动画sprite
/// frame_count: 游戏帧数
/// interval: 切换间隔
/// total_frame: 动画总帧数
pub fn get_sprite(frame_count: UInt, interval: UInt, total_frame: UInt) -> @wasm4.Sprite {
  @wasm4.sprite(kun_sprite_array[UInt::reinterpret_as_int(frame_count/interval % total_frame)])
}
