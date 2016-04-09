require './parrot'

parrot1 = Parrot.new("Becky","Fur is green","Beak is yellow")
p parrot1.name
p parrot1.fur_color
p parrot1.beak_color

parrot1.talk_to_parrot("He #{parrot1.name} can you repeat this")
