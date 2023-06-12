module TextColours
    COLOURINPUT = %w(r b y g o p)
    COLOURS = { :r => "\e[31m", :b => "\e[34m", :y => "\e[33my", 
                :g => "\e[32m", :o => "\e[38;2;#{255};#{165};#{0}m", :p => "\e[38;2;#{255};#{192};#{203}m", :blank => "\e[30m\u2753",
                :reset => "\e[0m" }
end
