import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

keyMappings = [ ((mod4Mask, xK_y), spawn "xscreensaver-command -lock")
              , ((controlMask, xK_Print), spawn "scrot -s")
              , ((0, xK_Print), spawn "scrot")
              ]

myConfig = defaultConfig { modMask = mod4Mask
                        , terminal = "st"
                        , focusFollowsMouse = False
                        , borderWidth = 0
                        , workspaces = map show [1..12]
                        , logHook = dynamicLogString defaultPP >>= xmonadPropLog
                        } `additionalKeys` keyMappings

main = xmonad =<< xmobar myConfig
