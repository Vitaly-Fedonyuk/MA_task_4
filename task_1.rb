
class BricksFactory
  attr_accessor :how_briсk

  def initialize(how_briсk)
    @how_brick = how_briсk
  end

  def normal_brick
    @normal_brick = []
    all_brick.each do |brick|
      @normal_brick << brick if brick[:status] != 'brick broken'
    end
    @normal_brick
  end

  def groups_brick
    @normal_brick.group_by{|h| h[:color]}.values
  end

  def serial_number
    @normal_brick.last[:serial_number]
  end

  private

  # @return [Array]
  def all_brick
    @some_brick = []
    ser_number = 0
    (1..@how_brick).to_a.each_with_index do |bricks, index|
      @some_brick << {
        color: "#{random_color}"
      }
      if rand(100) < 20
        @some_brick[index][:status] = 'brick broken'
      else
        @some_brick[index][:serial_number] = "#{ser_number+=1}"
        @some_brick[index][:status] = 'brick normal'
      end
    end
    @some_brick
  end

  def random_color
    %w[white black brown].sample
  end
end

q1 = BricksFactory.new(15)
p q1.normal_brick
p '-------------------------------------------------'
p q1.groups_brick
p '-------------------------------------------------'
p q1.serial_number



