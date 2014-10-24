{-# LANGUAGE CPP, TemplateHaskell #-}
-----------------------------------------------------------------------------
--
-- Module      :  RTLParser
-- Copyright   :
-- License     :  AllRightsReserved
--
-- Maintainer  :
-- Stability   :
-- Portability :
--
-- |
--
-----------------------------------------------------------------------------

module RTLParser where
import Network.HTTP
import Text.HTML.TagSoup
import Data.List

openURL x = getResponseBody =<< simpleHTTP (getRequest x)

downloadTicker :: [Char] -> IO String
downloadTicker t = openURL $ "http://www.rtl.de/formel1/liveticker?ticker=" ++ t

parseTicker :: [Char] -> [Tag String] -> [String]
parseTicker col = map parseRecord
            . sections (~== col)
            . dropWhile (~/= "<div class=ticker_texts id=ticker_texts>")

parseRecord xs = fst (innerText a, unwords $ words $ innerText b)
    where (a,b) = break (~== ">") (takeWhile (~/= "</td>") xs)


getStream :: [Char] -> IO [(String, String)]
getStream t = do
        tags <- fmap parseTags $ downloadTicker t
        let rounds = parseTicker "<td class=left>" tags
        let comments = parseTicker "<td class=right>" tags
        let stream = zip rounds comments
        return stream
