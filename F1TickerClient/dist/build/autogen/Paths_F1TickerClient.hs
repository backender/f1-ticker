module Paths_F1TickerClient (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [1,0,0,2], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/marc/Library/Haskell/ghc-7.8.3/lib/F1TickerClient-1.0.0.2/bin"
libdir     = "/Users/marc/Library/Haskell/ghc-7.8.3/lib/F1TickerClient-1.0.0.2/lib"
datadir    = "/Users/marc/Library/Haskell/ghc-7.8.3/lib/F1TickerClient-1.0.0.2/share"
libexecdir = "/Users/marc/Library/Haskell/ghc-7.8.3/lib/F1TickerClient-1.0.0.2/libexec"
sysconfdir = "/Users/marc/Library/Haskell/ghc-7.8.3/lib/F1TickerClient-1.0.0.2/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "F1TickerClient_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "F1TickerClient_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "F1TickerClient_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "F1TickerClient_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "F1TickerClient_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
