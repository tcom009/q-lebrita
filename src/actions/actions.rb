module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verificar que la siguiente casilla sea valida
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      # si no lo es terminamos el juego
      end_game(state)
    end
    # si es valida movemos la serpiente
  end

  def self.calc_next_position(state)
    curr_position = state.snake.positions.first
    case state.next_direction
    when Model::Direction::UP
      # DECREMENTAR FILA
      return Model::Coord.new(
        curr_position.row - 1,
        curr_position.col)
    when Model::Direction::DOWN
      # INCREMENTAR FILA
      return  Model::Coord.new(
        curr_position.row + 1,
        curr_position.col)
    when Model::Direction::RIGHT
      # INCREMENTAR COL
      return  Model::Coord.new(
        curr_position.row,
        curr_position.col + 1)
    when Model::Direction::LEFT
      # DECREMENTAR COL
      return  Model::Coord.new(
        curr_position.row,
        curr_position.col - 1)
    end
  end

  def self.position_is_valid?(state, position)
    # verificar que esta en la grilla
    is_invalid = ((state.grid.rows <= position.row || 
      position.row < 0) ||
        (state.grid.cols <= position.col || position.col < 0))
    return false if is_invalid

    # verificar que no este superponinendo la serpiente
    return !(state.snake.positions.include? position)
  end

  def self.move_snake_to(state, next_position)
    new_position = [next_position] + state.snake.positions[0...-1]
    state.snake.positions = new_position
    state
  end

  def self.end_game(state)
    state.game_finished = true
    state
  end
end


