import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar def
        { modMask = mod4Mask
        , terminal = "st"
        }
