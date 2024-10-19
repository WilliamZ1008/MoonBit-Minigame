pub fn judge_stage(game: Game) -> Unit {
  // 判断结束或难度增加
  if game.score >= config_CLEARANCE_SCORE {
    game.frame_count = 0
    game.score = 0
    game.state = 1
  }
  // frame_count
  if game.frame_count >= config_FRAME_COUNT {
    game.frame_count = 0
    game.score = 0
    game.state = 2
  }
}