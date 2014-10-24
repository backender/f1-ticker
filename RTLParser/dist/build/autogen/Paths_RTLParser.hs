module Paths_RTLParser (
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
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Marc/Library/Haskell/bin"
libdir     = "/Users/Marc/Library/Haskell/ghc-7.8.3-x86_64/lib/RTLParser-0.0.1"
datadir    = "/Users/Marc/Library/Haskell/share/ghc-7.8.3-x86_64/RTLParser-0.0.1"
libexecdir = "/Users/Marc/Library/Haskell/libexec"
sysconfdir = "/Users/Marc/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "RTLParser_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "RTLParser_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "RTLParser_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "RTLParser_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "RTLParser_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
