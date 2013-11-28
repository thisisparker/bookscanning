#!/usr/bin/ruby

for i in Dir.glob("*.tif")
	puts "Performing OCR on #{i.chomp}."
	`tesseract #{i.chomp} ocroutput`
	`cat ocroutput.txt >> finaltext.txt`
end