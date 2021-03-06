{-# OPTIONS_GHC -fno-warn-orphans #-}

{-# LANGUAGE OverloadedStrings #-}

module Distribution.Version.JSON where

import Data.Aeson (ToJSON (toJSON), Value (String))
import Data.Text (pack)
import Distribution.Text (disp)
import Distribution.Version (anyVersion, simplifyVersionRange, VersionRange)
import Text.PrettyPrint (render)

instance ToJSON VersionRange where
  toJSON v | v == anyVersion = String "*"
           | otherwise       = String (pack $ render $ disp $ simplifyVersionRange v)
