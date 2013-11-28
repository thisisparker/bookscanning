bookscanning
============

Some scripts and things for processing scanned books. These will probably only be useful to people that have a huge directory of TIFF files of the sort that ScanTailor puts out after processing a huge directory of JPEG files that a DIY Book Scanner produces. I wrote these to help process a book scanned at Noisebridge.

These steps assume you've got `imagemagick`, `tesseract`, `pdftk`, and, like, Perl and Ruby installed.

`looptifftopdf.rb` converts all those TIFFs to PDF files in a subdirectory called `/pdf/`. Then I just went into that directory and used pdftk like `pdftk *.pdf cat full-book.pdf`. It's made a very large PDF, and I'm working on making that smaller.

`ocrthethings.rb` runs through the same TIFFs with Tesseract and produces a final OCRed output that is pretty good. One weird thing is it had page numbers in it, which I don't think I need. The difficult part is that they're surrounded by newlines, and I couldn't just strip out all the lines at once with grep or sed or whatever. So I turned to Perl, and used this one-liner:

`perl -pe 'undef $/; s/\n\d{1,3}\n\n//g' finaltext.txt > finaltext-nonums.txt`

That'll work so long as the page numbers are surrounded by newlines, are between 1 and 3 digits long, have nothing else on the same line, and you want to yank out all three lines each time.

TODO
====

* Make PDF much smaller, with some kinda optimization along the way
* (perhaps at cross purposes) add the OCR to the PDF with hOCR or something.
