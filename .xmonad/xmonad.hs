import XMonad
import XMonad.Actions.CycleWS(toggleWS, moveTo, Direction1D(Next, Prev), WSType(EmptyWS, NonEmptyWS))
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myDmenu = "dmenu_run -nf '#F6D6BD' -nb '#20394F' -sb '#4E495F' -sf '#c3a38a'"

keyMappings = [ ((mod4Mask, xK_y)              , spawn "xscreensaver-command -lock")
              , ((controlMask, xK_Print)       , spawn "scrot -s")
              , ((0, xK_Print)                 , spawn "scrot")
              , ((mod4Mask, xK_d)              , spawn myDmenu)
              , ((mod4Mask, xK_n)              , moveTo Next NonEmptyWS)
              , ((mod4Mask, xK_p)              , moveTo Prev NonEmptyWS)
              , ((mod4Mask, xK_q)              , toggleWS)
              , ((mod4Mask, xK_o)              , moveTo Next EmptyWS)
              , ((mod4Mask .|. shiftMask, xK_r), broadcastMessage ReleaseResources >> restart "xmonad" True)
              ]

myConfig = defaultConfig { modMask = mod4Mask
                        , terminal = "st"
                        , focusFollowsMouse = False
                        , borderWidth = 0
                        , workspaces = map show [1..12]
                        , logHook = dynamicLogString defaultPP >>= xmonadPropLog
                        } `additionalKeys` keyMappings

main = xmonad =<< xmobar myConfig
