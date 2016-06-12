module Paths_grid_greatest_product (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/boris/work-haskell/project-euler/grid-greatest-product/.cabal-sandbox/bin"
libdir     = "/home/boris/work-haskell/project-euler/grid-greatest-product/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/grid-greatest-product-0.1.0.0-AccR0hIeejz8QhjeZluNGZ"
datadir    = "/home/boris/work-haskell/project-euler/grid-greatest-product/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/grid-greatest-product-0.1.0.0"
libexecdir = "/home/boris/work-haskell/project-euler/grid-greatest-product/.cabal-sandbox/libexec"
sysconfdir = "/home/boris/work-haskell/project-euler/grid-greatest-product/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "grid_greatest_product_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "grid_greatest_product_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "grid_greatest_product_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "grid_greatest_product_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "grid_greatest_product_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
