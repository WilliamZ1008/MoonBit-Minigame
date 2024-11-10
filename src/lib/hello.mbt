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
  match game.state {
    Intro => {
      intro(game)
    }
    Playing => {
      play_level(game, pos, turn)
    }
    Win => {
      win(game)
    }
    Lose => {
      lose()
    }
  }

  // 更新帧数
  game.frame_count += 1
}