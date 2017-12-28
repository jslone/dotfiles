import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

main = xmonad =<< xmobar xmonadConfig

xmonadConfig = defaultConfig
    { terminal    = "urxvt"
    , borderWidth = 4
    , normalBorderColor = "black"
    , focusedBorderColor = "#bd93f9" --"#3AF0D1" -- "#FF1222" --"#69DFFA"   --"#E39402"    #00F2FF,
    , startupHook = setWMName "LG3D"
    , layoutHook = smartBorders $ smartSpacingWithEdge 5 $ Tall 1 (3/100) (1/2)
    }
