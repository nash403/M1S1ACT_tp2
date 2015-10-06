import System.IO
import System.Environment
import Data.List

type Immeuble = (Int, Int, Int)
type Point = (Int, Int)
type Skyline = [Point]

-- Transforme un immeuble en Skyline composées de deux points 
toSkyline::Immeuble -> Skyline
toSkyline (g,h,d) = [(g,h),(d,0)]

-- Fonction intermédiaire appelée par le mergeSkyline et qui fait effectivement le merge
realMS:: Int -> Int -> Skyline -> Skyline -> Skyline
realMS _ _ xs []                   = xs
realMS _ _ [] xs                   = xs
realMS h1 h2 ((m,n):ms) ((x,y):xs)
        | m > x     = case h1 >= y of True  -> (
                                        if (h2 >= h1)
                                        then
                                          (if h2 == h1 then realMS h1 y ((m,n):ms) xs else (x,h1):realMS h1 y ((m,n):ms) xs)
                                        else
                                          (if (n > y) || (h1 == y) then realMS h1 y ((m,n):ms) xs else (m,y):realMS h1 y ((m,n):ms) xs)
                                        ) 
                                      False -> (x,y):realMS h1 y ((m,n):ms) xs
        | m < x     = case h2 > n of  True  -> realMS n h2 ms ((x,y):xs)
                                      False -> (m,n):realMS n h2 ms ((x,y):xs)
        | otherwise = case n > y of True  -> (m,n):realMS n y ms xs
                                    False -> (x,y):realMS n y ms xs

-- On insère s1 dans s2
mergeSkyline::Skyline -> Skyline -> Skyline
mergeSkyline s1 s2 = realMS 0 0 s1 s2

insereImmeuble::Immeuble -> Skyline -> Skyline
insereImmeuble i [] = toSkyline i
insereImmeuble i s  = mergeSkyline (toSkyline i) s

split :: [a] -> ([a],[a])   
split (x:y:zs) = (x:xs,y:ys) where (xs,ys) = split zs
split xs       = (xs,[])

constructSkyline::[Immeuble] -> Skyline
constructSkyline [] = []
constructSkyline [x] = toSkyline x
constructSkyline xs = mergeSkyline (constructSkyline xs1) (constructSkyline xs2)
        where (xs1,xs2) = split xs

--Pour test, transforme les immeubles en points de manière violente
immeublesToSkyline:: [Immeuble] -> Skyline
immeublesToSkyline []           = []
immeublesToSkyline ((g,h,d):xs) = (g,h):(d,0):(immeublesToSkyline xs)  

--Transforme une Skyline où un point sur deux est écrit en Skyline où tout les points sont écrit
listePointComplet:: Skyline -> Skyline
listePointComplet xs                   = listePointCompletInter ((0,0):xs)
                                         where listePointCompletInter []                   = []
                                               listePointCompletInter (x:[])               = [x]
                                               listePointCompletInter ((x1,y1):(x2,y2):xs) = (x1,y1):(x2,y1):(listePointCompletInter ((x2,y2):xs))

--Ecris le SVG à partir de la skyline dans le fichier désigner par fileName
lineToSVG:: Skyline -> String -> IO ()
lineToSVG skyLine fileName = do
                                appendFile fileName "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"300\" height=\"300\" viewBox=\"-10 -150 200 150\">\n<polyline points=\""
                                toSVGPoint skyLine fileName
                                appendFile fileName "\"\nstroke=\"blue\" stroke-width=\"1\" fill=\"none\" transform=\"scale(5,-5)\"/></svg>"
                                where toSVGPoint [] fileName         = appendFile fileName ""
                                      toSVGPoint ((x,y):xs) fileName = do
                                                                       appendFile fileName ((show x) ++ "," ++ (show y) ++ " ")
                                                                       toSVGPoint xs fileName

--Récupère le chemin du fichier sans l'extension
suffFich     :: String -> String
suffFich s =  case dropWhile (=='.') s of
                      "" -> ""
                      s' -> w 
                            where (w, s'') = break (=='.') s'

--Lis les immeubles à partir du fichier si celui si est bien fait
readImmeuble:: [String] -> Int -> [Immeuble]
readImmeuble _ 0    = []
readImmeuble (l:ls) n = (toImmeuble listIm):(readImmeuble ls (n-1))
                        where toImmeuble [g,h,d] = ((read g::Int), (read h::Int), (read d::Int))
                              listIm = words l

--Pour executer le main lui passer en argument le lien du fichier contenant les immeubles
main = do
        (fichier:args) <- getArgs
        handle <- openFile fichier ReadMode
        nbImmeuble <- hGetLine handle
        endFile <- hGetContents handle
        lineToSVG (listePointComplet (immeublesToSkyline (readImmeuble (lines endFile) (read nbImmeuble::Int)))) ((suffFich fichier) ++ ".html") -- remplacé immeublesToSkyline par la fonction qui transforme une liste d'immeuble en skyline
        putStr ("Le svg a été créé dans le fichier suivant : " ++ ((suffFich fichier) ++ ".html") ++ "\n")
        hClose handle
