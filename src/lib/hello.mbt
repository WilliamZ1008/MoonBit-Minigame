// 变量和初始化部分
let pos : Position = { x : 72, y : 90}
let turn : Turn = { value : false}
let game : Game = Game::new()

// 初始化函数
pub fn start() -> Unit {
  @wasm4.set_draw_colors(index=1, 2)
}

// 逐帧更新函数
pub fn update() -> Unit {
  if game.state == 0{
    // 播放音乐
    play_music(game.frame_count)

    // 检测按键移动 kunkun
    move_kunkun(pos, turn)

    // 随机水果
    random_fruit(pos, game)

    // 绘制角色
    @wasm4.blit(smiley_sprite, pos.x, pos.y, 8, 8, {one_bit_per_pixel: false, flip_x: false, flip_y: turn.value, rotate: true})
    // @wasm4.blit(get_sprite(game.frame_count, 10, 10), pos.x, pox.y, 50, 50, {one_bit_per_pixel: true, flip_x: false, flip_y: false, rotate: false})

    
    // 显示 Score
    @wasm4.text("Score: " + game.score.to_string(), 0, 0)
    @wasm4.text("Frame: " + game.frame_count.to_string(), 70, 0)
    
    // 更新帧数
    game.frame_count += 1

    // 判断结束或难度增加
    judge_stage(game)    
  }

  else if game.state == 1{
    // 显示结束
    @wasm4.text("You Win!", 50, 60)
    @wasm4.blit(get_sprite(game.frame_count, 10, 10), 55, 90, 50, 50, {one_bit_per_pixel: true, flip_x: false, flip_y: false, rotate: false})
    game.frame_count += 1
  }

  else{
    // 显示结束
    @wasm4.text("You Lose!", 50, 60)
  }
}