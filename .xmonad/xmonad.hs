import qualified Data.Map as M
import qualified XMonad.StackSet as W

import System.Exit
import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig

main = do
    session <- getEnv "DESKTOP_SESSION"
    xmonad =<< xmobar ( addMyConfig (desktopFromSessionEnv session ) )

desktop "gnome" = gnomeConfig
desktop "kde" = kde4Config
desktop "xfce" = xfceConfig
desktop "xmonad-mate" = gnomeConfig
desktop _ = desktopConfig

desktopFromSessionEnv = maybe desktopConfig desktop

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf) -- %! Launch terminal
    , ((modMask,               xK_p     ), spawn "dmenu_run") -- %! Launch dmenu
    , ((modMask .|. shiftMask, xK_p     ), spawn "gmrun") -- %! Launch gmrun
    , ((modMask .|. shiftMask, xK_j     ), kill) -- %! Close the focused window

    , ((modMask,               xK_space ), sendMessage NextLayout) -- %! Rotate through the available layout algorithms
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) -- %!  Reset the layouts on the current workspace to default

    , ((modMask,               xK_b     ), refresh) -- %! Resize viewed windows to the correct size

    -- move focus up or down the window stack
    , ((modMask,               xK_Tab   ), windows W.focusDown) -- %! Move focus to the next window
    , ((modMask .|. shiftMask, xK_Tab   ), windows W.focusUp  ) -- %! Move focus to the previous window
    , ((modMask,               xK_h     ), windows W.focusDown) -- %! Move focus to the next window
    , ((modMask,               xK_t     ), windows W.focusUp  ) -- %! Move focus to the previous window
    , ((modMask,               xK_m     ), windows W.focusMaster  ) -- %! Move focus to the master window

    -- modifying the window order
    , ((modMask,               xK_Return), windows W.swapMaster) -- %! Swap the focused window and the master window
    , ((modMask .|. shiftMask, xK_h     ), windows W.swapDown  ) -- %! Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_t     ), windows W.swapUp    ) -- %! Swap the focused window with the previous window

    -- resizing the master/slave ratio
    , ((modMask,               xK_d     ), sendMessage Shrink) -- %! Shrink the master area
    , ((modMask,               xK_n     ), sendMessage Expand) -- %! Expand the master area

    -- floating layer support
    , ((modMask,               xK_y     ), withFocused $ windows . W.sink) -- %! Push window back into tiling

    -- increase or decrease number of windows in the master area
    , ((modMask              , xK_w ), sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
    , ((modMask              , xK_v), sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area

    -- quit
    , ((modMask              , xK_BackSpace), spawn "xmonad --restart")
    , ((modMask .|. shiftMask, xK_q ), io (exitWith ExitSuccess))
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    {-++-}
    {--- mod-{w,e,r} %! Switch to physical/Xinerama screens 1, 2, or 3-}
    {--- mod-shift-{w,e,r} %! Move client to screen 1, 2, or 3-}
    {-[((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))-}
        {-| (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]-}
        {-, (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]-}

extraKeys = [ ("<XF86AudioLowerVolume>"        ,spawn "pulseaudio-ctl down 10")
            , ("<XF86AudioRaiseVolume>"        ,spawn "pulseaudio-ctl up 10"  )
            , ("<XF86AudioMute>"               ,spawn "pulseaudio-ctl mute"   )
            , ("<XF86MonBrightnessDown>"       ,spawn "light -U 5"            )
            , ("<XF86MonBrightnessUp>"         ,spawn "light -A 5"            )
--            , ("<XF86AudioPlay>"               ,spawn "play-pause-mpd.sh"     )
--            , ("<XF86AudioPrev>"               ,spawn "mpc prev"     )
--            , ("<XF86AudioNext>"               ,spawn "mpc next"     )
            , ("<XF86PowerOff>"                ,spawn "poweroff" )
--            , ("<F12>"                         ,namedScratchpadAction myScratchpads "termscratch")
		    ]


addMyConfig config = config
    { terminal    = "urxvt"
    , borderWidth = 4
    , normalBorderColor = "black"
    , focusedBorderColor = "#bd93f9" --"#3AF0D1" -- "#FF1222" --"#69DFFA"   --"#E39402"    #00F2FF,
    , keys = myKeys
    , startupHook = do
        setWMName "LG3D"
    , layoutHook = smartBorders
                 $ smartSpacingWithEdge 5
                 $ Tall 1 (3/100) (1/2)
    }
    `additionalKeysP` extraKeys
