# frozen_string_literal: true
require 'byebug'
# Create brick
class BricksFactory
  attr_accessor :how_brick
  attr_reader :serial_number

  def initialize(how_brick, color)
    @how_brick = how_brick
    @color = color
  end

  # @return [Array]
  def all_brick
    @serial_number = 0
    @some_brick = []
    (1..@how_brick).to_a.each_with_index do |_, index|
      @some_brick << Bricks.new({ color: random_color.to_s }).status_bricks
      @serial_number += 1 if @some_brick[index][:status] == 'brick normal'
    end
    # debugger
    @some_brick
  end

  def normal_ten_brick_by_color
    @brick_by_color = []
    @some_brick.each_with_index do |brick, index|
      @brick_by_color << brick
      if index < 10 && (brick[:status] != 'brick broken')
        @brick_by_color << brick
      end
    end
    @normal_brick
  end

  def groups_brick
    @normal_brick.group_by { |h| h[:color] }.values
  end

  def random_color
    %w[white black brown].sample
  end
end

# Bricks status
class Bricks
  attr_reader :bricks_parameter, :serial_number

  def initialize(bricks_parameter)
    @bricks_parameter = bricks_parameter
  end

  def status_bricks
    @bricks_parameter[:status] = rand(100) < 20 ? 'brick broken' : 'brick normal'
    @bricks_parameter
  end
end

q1 = BricksFactory.new(15, 'black')
p q1.all_brick
p '-------------------------------------------------'
p q1.serial_number
p '-------------------------------------------------'
p q1.normal_ten_brick_by_color
p '-------------------------------------------------'
p q1.groups_brick
p '-------------------------------------------------'


