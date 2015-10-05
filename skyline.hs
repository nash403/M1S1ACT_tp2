type Immeuble = (Int, Int, Int)
type Point = (Int, Int)
type Skyline = [Point]

immeuble::Int -> Int -> Int -> Immeuble
immeuble g h d = (g,h,d)

g::Immeuble -> Int
g (x,_,_) = x

d::Immeuble -> Int
d (_,_,x) = x

h::Immeuble -> Int
h (_,x,_) = x

hasNext::Skyline -> Bool
hasNext [] = False
hasNext _  = True

insereD::Int -> Immeuble -> Skyline -> Skyline
insereD _ (_,_,d) []          = [(d,0)]
insereD n (g,h,d) ((x,y):ss) =
  if d > x
  then
    if h > y -- h est au dessus de la skyline
    then (x:h):(insereD y (g,h,d) ss) --
    else (x:y):(insereD y (g,h,d) ss)
  else  -- d <= x
    if (d < x)
    then
      if h > n -- le coin droit est visible
      then (d,n):(x,y):ss
      else  (x,y):ss -- le coin droit n'est pas visible
    else -- d == x
      (x,y):ss 

insereImmeuble::Immeuble -> Skyline -> Skyline
insereImmeuble (g,h,d) [] 		    = [(g,h),(d,0)]
insereImmeuble (g,h,d) ((x,y):xs) =
	if g > x -- g se trouve dans la skyline
	then
		if (((hasNext xs) &&  (g > (fst (head xs)))) || (!(hasNext xs))) --TODO vérifier insertion après skyline
    then (x,y):(insereImmeuble (g,h,d) xs)
    else -- g se trouve entre x et x+1
      if h > y -- le coin gauche est visible
      then (x,y):(g,h):(insereD y (g,h,d) xs)
      else (x,y):(insereD y (g,h,d) xs) -- le coin gauche n'est pas visible
  else -- g se trouve avant le reste de la skyline
    -- g est visible
    if d < x -- le coin droit est avant la skyline
    then (g,h):(d,0):((x,y):xs)
    else  
      if d > x
      then  
        if (hasNext xs) && (d < fst (head xs)) -- d est entre x et x+1
        then  
          if h < y
          then (g,h):(x,y):xs
          else (g,h):(d,y):xs
      else -- d == x
        (g,h):(insereD y (g,h,d) xs)
