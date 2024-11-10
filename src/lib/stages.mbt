pub fn intro(game: Game) -> Unit{
    @wasm4.text("Level: "+ game.level.to_string(), 50, 40)
    @wasm4.text("Press X to Start", 15, 60)
    if @wasm4.get_gamepad(index=1).button_1 {
        game.frame_count = 0
        game.state = GameState::Playing
    }
}

pub fn play_level(game: Game, pos: Position, turn: Turn) -> Unit{
    
    // 检测按键移动 kunkun
    move_kunkun(pos, turn, game)

    // 随机水果
    random_fruit(pos, game)

    // 绘制角色
    @wasm4.blit(smiley_sprite, pos.x, pos.y, 8, 8, {one_bit_per_pixel: false, flip_x: false, flip_y: turn.value, rotate: true})
    // 显示 Score
    if game.score < 10 {
        @wasm4.text("Score: " + game.score.to_string() + "/" + game.clearance_score.to_string(), 0, 0)
    } else {
        @wasm4.text("Score:" + game.score.to_string() + "/" + game.clearance_score.to_string(), 0, 0)
    }

    @wasm4.text("Level:" + game.level.to_string(), 95, 0)
    
    // 显示时间条
    @wasm4.rect(0, 158, (game.frame_count.reinterpret_as_int().to_double() / game.level_max_frame_count.reinterpret_as_int().to_double()*160).to_int(), 2)

    // 判断结束或难度增加
    judge_stage(game)  

}

pub fn win(game: Game) -> Unit{
    // 游戏胜利
    @wasm4.text("You Win!", 50, 60)
    @wasm4.blit(get_sprite(game.frame_count, 10, 10), 55, 90, 50, 50, {one_bit_per_pixel: true, flip_x: false, flip_y: false, rotate: false})
    play_kun_music(game.frame_count)

    if game.frame_count >= 500 || @wasm4.get_gamepad(index=1).button_1{
        reset_kun_music()
        game.level += 1
        game.frame_count = 0
        game.score = 0
        update_level(game)
        game.state = GameState::Intro
    }
}

pub fn lose() -> Unit{
    // 游戏失败
    @wasm4.text("Game Over!", 45, 50)
    @wasm4.text("Your Record Is:", 20, 70)
    @wasm4.text("Level: "+ game.level.to_string(), 50, 90)
}