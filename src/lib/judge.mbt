pub fn judge_stage(game: Game) -> Unit {
  // 判断结束或难度增加
  if game.score >= game.clearance_score {
    game.frame_count = 0
    game.score = 0
    game.state = GameState::Win
  }
  // frame_count
  if game.frame_count >= game.level_max_frame_count {
    game.frame_count = 0
    game.score = 0
    game.state = GameState::Lose
  }
}