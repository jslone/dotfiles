import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar xmonadConfig


xmonadConfig = defaultConfig
    { terminal    = "urxvt"
    , borderWidth = 3
    }
