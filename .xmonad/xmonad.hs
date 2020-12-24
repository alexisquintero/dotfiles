import XMonad
import XMonad.Actions.CycleWS(toggleWS, moveTo, Direction1D(Next, Prev), WSType(EmptyWS, NonEmptyWS))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO

myDmenu = "dmenu_run -nf '#F6D6BD' -nb '#20394F' -sb '#4E495F' -sf '#c3a38a'"

keyMappings = [ ((mod4Mask, xK_y)                   , spawn "xscreensaver-command -lock")
              , ((controlMask, xK_Print)            , spawn "sleep 0.2; scrot -s")
              , ((0, xK_Print)                      , spawn "scrot")
              , ((mod4Mask, xK_d)                   , spawn myDmenu)
              , ((mod4Mask, xK_n)                   , moveTo Next NonEmptyWS)
              , ((mod4Mask, xK_p)                   , moveTo Prev NonEmptyWS)
              , ((mod4Mask, xK_q)                   , toggleWS)
              , ((mod4Mask, xK_o)                   , moveTo Next EmptyWS)
              , ((mod4Mask .|. shiftMask, xK_r)     , broadcastMessage ReleaseResources >> restart "xmonad" True)
              , ((mod4Mask, xK_0)                   , windows $ W.greedyView "10")
              , ((mod4Mask .|. shiftMask, xK_0)     , windows $ W.shift "10")
              , ((mod4Mask, xK_minus)               , windows $ W.greedyView "11")
              , ((mod4Mask .|. shiftMask, xK_minus) , windows $ W.shift "11")
              , ((mod4Mask, xK_equal)               , windows $ W.greedyView "12")
              , ((mod4Mask .|. shiftMask, xK_equal) , windows $ W.shift "12")
              , ((mod4Mask, xK_x)                   , spawn "firefox")
              , ((mod4Mask, xK_c)                   , spawn "chromium")
              , ((mod4Mask, xK_n)                   , sendMessage ToggleStruts)
              , ((0, xF86XK_TouchpadToggle)         , spawn "toggle-touchpad")
              , ((0, xF86XK_MonBrightnessDown)      , spawn "light -U 10")
              , ((0, xF86XK_MonBrightnessUp)        , spawn "light -A 10")
              , ((0, xF86XK_AudioLowerVolume)       , spawn "amixer -q set Master 5%- unmute")
              , ((0, xF86XK_AudioRaiseVolume)       , spawn "amixer -q set Master 5%+ unmute")
              , ((0, xF86XK_AudioMute)              , spawn "amixer -q set Master toggle")
              ]

myConfig = def { modMask = mod4Mask
               , terminal = "st"
               , focusFollowsMouse = False
               , borderWidth = 0
               , workspaces = map show [1..12]
               , logHook = dynamicLogString defaultPP >>= xmonadPropLog
               } `additionalKeys` keyMappings

main = xmonad =<< xmobar myConfig
