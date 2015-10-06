all : skyline

.PHONY: clean test

skyline: skyline.hs
	ghc -o skyline skyline.hs
       
test:
	./skyline exemple.txt
	
clean:
	rm -f *~ *.o *.hi skyline exemple.html
