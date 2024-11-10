pub fn update_level(game: Game) -> Unit {
  game.level_max_frame_count = @math.maximum(1000U-(game.level*game.level).reinterpret_as_uint(), 200)
  game.clearance_score = 10 + @math.ln(5.0 * game.level.to_double()).to_int()
  game.egg_speed = 1 + @math.ln(game.level.to_double()).to_int()
}