class Parrot
  attr_accessor :name, :fur_color, :beak_color
  def initialize(name, fur_color, beak_color)
    @name = name
    @fur_color = fur_color
    @beak_color = beak_color
  end

  def move
    "#{@name} flaps its wings"
  end

  def talk_to_parrot(string)
    @talkto = string
    repeat(@talkto)
  end

  def repeat(repeat_text)
      puts "#{repeat_text}"
      puts "quackkkk #{repeat_text} quackkkk"
  end
end
