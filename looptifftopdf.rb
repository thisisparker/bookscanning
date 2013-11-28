#!/usr/bin/ruby

for i in Dir.glob("*.tif")
	puts "Creating #{i.sub(/\.tif$/, "").chomp}.pdf"
	`convert #{i.chomp} pdf/#{i.sub(/\.tif$/, "".chomp)}.pdf`
end