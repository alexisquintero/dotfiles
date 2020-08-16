import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar def
        { modMask = mod4Mask
        , terminal = "st"
        , focusFollowsMouse = False
        , borderWidth = 0
        , workspaces = map show [1..12]
        }
