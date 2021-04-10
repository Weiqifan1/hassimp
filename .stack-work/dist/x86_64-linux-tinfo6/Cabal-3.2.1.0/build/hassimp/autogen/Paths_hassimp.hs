{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hassimp (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/bin"
libdir     = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/lib/x86_64-linux-ghc-8.10.4/hassimp-0.1.0.0-3iEDNBtwSFNJx4STgAk9XU-hassimp"
dynlibdir  = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/share/x86_64-linux-ghc-8.10.4/hassimp-0.1.0.0"
libexecdir = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/libexec/x86_64-linux-ghc-8.10.4/hassimp-0.1.0.0"
sysconfdir = "/home/pc20201005/Documents/HaskellProjects/hassimp/.stack-work/install/x86_64-linux-tinfo6/8dc51adaa75d0c688da52df5104ee52bc0f090621052ad9510f956fce6e3e70a/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hassimp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hassimp_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hassimp_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hassimp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hassimp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hassimp_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
