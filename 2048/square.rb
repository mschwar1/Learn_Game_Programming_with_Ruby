require 'gosu'

class Square
	FONT_SIZE = 45
	attr_reader :row, :col, :val

	@@fib_keys = [0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

	def initialize(window, col, row, val)
		@@colors ||= {c1: Gosu::Color.argb(0xaac065eb),
					  c2: Gosu::Color.argb(0xaaae2deb),
					  c3: Gosu::Color.argb(0xaacb2deb),
					  c4: Gosu::Color.argb(0xaaeb2deb),
					  c5: Gosu::Color.argb(0xaac41ac4),
					  c6: Gosu::Color.argb(0xaadb35b7),
					  c7: Gosu::Color.argb(0xaad10fa7),
					  c8: Gosu::Color.argb(0xaad64f9e),
				  	c9: Gosu::Color.argb(0xaae62294),
				   c10: Gosu::Color.argb(0xaae62263),
				   c11: Gosu::Color.argb(0xaaeb0753)}
		@@window ||= window
		@@font ||= Gosu::Font.new(FONT_SIZE)
		@row = row
		@col = col
		@val = val
		@show = @@fib_keys[val]
	end

	def draw
		if @val != 0
			x1 = 22 + @col * 100
			y1 = 22 + @row * 100
			x2 = x1 + 96
			y2 = y1
			x3 = x2
			y3 = y2 + 96
			x4 = x1
			y4 = y3
			@color = ("c"+@val.to_s).to_sym
			c = @@colors[@color]
			@@window.draw_quad(x1, y1, c, x2, y2, c, x3, y3, c, x4, y4, c, 1)
			x_center = x1 + 48
			x_text = x_center - @@font.text_width("#{@show}") / 2
			#y_text = y1 + 12
			y_text = y1 + (96 - FONT_SIZE)/2
			@@font.draw("#{@show}", x_text, y_text, 2)
		end
	end

	def clear
		@val = 0
	end

	def set (val)
		@val = val
		@show = @@fib_keys[val]
	end

end
