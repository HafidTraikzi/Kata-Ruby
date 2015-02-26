describe "Jeu de la vie" do
  it "grille vide" do
    game = JeuDeLaVie.new
    game.update!
    expect(game.grid).to eq([[0,0,0],
                             [0,0,0],
                             [0,0,0]])
  end

  it "3 cellules voisines vivantes, 1 cellule créée" do
    game = JeuDeLaVie.new([[1,1,1],
                           [0,0,0],
                           [0,0,0]])
    game.update!
    expect(game.grid).to eq([[1,1,1],
                             [1,1,1],
                             [1,1,1]])
  end

  it "1 cellule vivante, 1 cellule morte" do
    game = JeuDeLaVie.new([[1,0,0],
                           [0,0,0],
                           [0,0,0]])
    game.update!
    expect(game.grid).to eq([[0,0,0],
                             [0,0,0],
                             [0,0,0]])
  end
end
  
describe "still_alive?" do
  it "vrai quand 2 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,1,1],
                           [0,0,0],
                           [0,0,0]])
    expect(game.still_alive?(0, 1)).to be_truthy
  end

  it "vrai quand 3 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,0,0],
                           [1,1,0],
                           [0,1,0]])
    expect(game.still_alive?(1, 1)).to be_truthy
  end

  it "faux quand moins de 2 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,1,0],
                           [0,0,0],
                           [0,0,0]])
    expect(game.still_alive?(0, 1)).to be_falsy
  end

  it "faux quand plus de 3 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,1,1],
                           [1,1,0],
                           [0,0,0]])
    expect(game.still_alive?(1, 1)).to be_falsy
  end
end

describe "born?" do
  it "vrai quand 3 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,0,1],
                           [1,0,0],
                           [0,0,0]])
    expect(game.born?(1, 1)).to be_truthy
  end

  it "faux quand moins de 3 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,0,1],
                           [0,0,0],
                           [0,0,0]])
    expect(game.born?(1, 1)).to be_falsy
  end

  it "faux quand plus de 3 cellules vivantes voisines" do
    game = JeuDeLaVie.new([[1,1,1],
                           [1,0,0],
                           [0,0,0]])
    expect(game.born?(1, 1)).to be_falsy
  end
end

describe "alive_neighbours_cells" do
  it "4" do
    game = JeuDeLaVie.new([[1,1,1],
                           [1,0,0],
                           [0,0,0]])
    expect(game.alive_neighbours_cells(1, 1)).to eq(4)
  end

  it "0" do
    game = JeuDeLaVie.new([[0,0,0],
                           [0,0,0],
                           [0,0,0]])
    expect(game.alive_neighbours_cells(1, 1)).to eq(0)
  end
end

class JeuDeLaVie

  EMPTY_GRID=[[0, 0, 0], [0, 0, 0], [0, 0, 0]]

  attr_reader :grid

  def initialize(grid=EMPTY_GRID)
    @grid = grid
  end 

  def update!
    new_grid = Array.new(@grid.length){ Array.new(@grid[0].length) }
    
    @grid.each_with_index do |line, i|
      line.each_with_index do |cell, j|
        if still_alive?(i, j) || born?(i, j)
          new_grid[i][j] = 1
        else
          new_grid[i][j] = 0
        end
      end
    end
    
    @grid = new_grid
  end
  
  def born?(x, y)
    alive_neighbours_cells(x, y) == 3
  end

  def still_alive?(x, y)
    alive_neighbours_cells(x, y) >= 2 && alive_neighbours_cells(x, y) <= 3
  end
  
  def alive_neighbours_cells(x, y)
    alive_cells = 0
    coordinates = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    coordinates.each do |c|
      xpos = (x + c[0]) % @grid.length
      ypos = (y + c[1]) % @grid.length
      cell = @grid[xpos][ypos]
      alive_cells += 1 if cell == 1
    end
    alive_cells
  end
  
end
