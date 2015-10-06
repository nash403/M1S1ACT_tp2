all : skyline

skyline: skyline.hs
	ghc skyline.hs
        
clean:
	rm -f *~ *.o *.hi skyline
