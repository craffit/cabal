module PackageTests.BuildDeps.TargetSpecificDeps2.Check where

import Test.HUnit
import PackageTests.PackageTester
import System.FilePath
import qualified Control.Exception as E


suite :: Test
suite = TestCase $ do
    let spec = PackageSpec ("PackageTests" </> "BuildDeps" </> "TargetSpecificDeps2") []
    result <- cabal_build spec
    do
        assertEqual "cabal build should succeed - see test-log.txt" True (successful result)
      `E.catch` \exc -> do
        putStrLn $ "Cabal result was "++show result
        E.throwIO (exc :: E.SomeException)
