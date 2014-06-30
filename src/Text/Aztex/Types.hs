module Text.Aztex.Types where
  
import qualified Data.Map as Map

data Aztex = CommandBlock Aztex
           | TextBlock Aztex
           | MathBlock Aztex
           | Token String 
           | Block [Aztex]
           | Binding String AztexFunction
           | CallBinding String [Aztex]
           | Import AztexBindings
  deriving Show

data AztexFunction = AztexFunction [String] Aztex
  deriving Show


data AztexMode = CommandMode | TextMode | MathMode deriving (Show, Eq)
data LatexMode = LatexText | LatexMath deriving (Show, Eq)

type AztexBindings = Map.Map String AztexFunction

data AztexState = AztexState { bindings :: AztexBindings
                             , exports :: AztexBindings
                             , aztexMode :: AztexMode
                             , latexMode :: LatexMode
                             }
  deriving Show

data AztexStyle = AztexStyle

type AztexError = [String]
type AztexParseResult = (Aztex, AztexBindings) -- AST and exports
