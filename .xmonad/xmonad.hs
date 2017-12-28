import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig

main = xmonad =<< xmobar xmonadConfig

extraKeys = [ ("<XF86AudioLowerVolume>"        ,spawn "pulseaudio-ctl down 10")
            , ("<XF86AudioRaiseVolume>"        ,spawn "pulseaudio-ctl up 10"  )
            , ("<XF86AudioMute>"               ,spawn "pulseaudio-ctl mute"   )
            , ("<XF86MonBrightnessDown>"       ,spawn "light -U 5"            )
            , ("<XF86MonBrightnessUp>"         ,spawn "light -A 5"            )
--            , ("<XF86AudioPlay>"               ,spawn "play-pause-mpd.sh"     )
--            , ("<XF86AudioPrev>"               ,spawn "mpc prev"     )
--            , ("<XF86AudioNext>"               ,spawn "mpc next"     )
--            , ("<XF86PowerOff>"                ,spawn "lock.sh" )
--            , ("<F12>"                         ,namedScratchpadAction myScratchpads "termscratch")
		  ]

xmonadConfig = defaultConfig
    { terminal    = "urxvt"
    , borderWidth = 4
    , normalBorderColor = "black"
    , focusedBorderColor = "#bd93f9" --"#3AF0D1" -- "#FF1222" --"#69DFFA"   --"#E39402"    #00F2FF,
    , startupHook = setWMName "LG3D"
    , layoutHook = smartBorders $ smartSpacingWithEdge 5 $ Tall 1 (3/100) (1/2)
    }
    `additionalKeysP` extraKeys
