import Data.Bifunctor as B
import XMonad
import XMonad.Actions.CycleWS (Direction1D (Next, Prev), WSType (EmptyWS, NonEmptyWS), moveTo, toggleWS)
import XMonad.Hooks.DynamicLog
  ( dynamicLogString,
    xmobar,
    xmonadPropLog,
  )
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.ManageDocks
  ( Direction1D (Next, Prev),
    ToggleStruts (ToggleStruts),
  )
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeys)

modKey :: KeyMask
modKey = mod4Mask

withMod :: KeySym -> (KeyMask, KeySym)
withMod k = (modKey, k)

withShiftMod :: KeySym -> (KeyMask, KeySym)
withShiftMod k = (modKey .|. shiftMask, k)

keyMappings :: [((KeyMask, KeySym), X ())]
keyMappings =
  ( B.first withMod
      <$> [ (xK_n, moveTo Next NonEmptyWS),
            (xK_o, moveTo Next EmptyWS),
            (xK_p, moveTo Prev NonEmptyWS),
            (xK_q, toggleWS),
            (xK_t, sendMessage ToggleStruts)
          ]
  )
    ++ ( B.first withShiftMod
           <$> [(xK_r, broadcastMessage ReleaseResources >> restart "xmonad" True)]
       )
    ++ ( B.bimap withMod windows
           <$> [ (xK_0, W.greedyView "10"),
                 (xK_equal, W.greedyView "12"),
                 (xK_minus, W.greedyView "11")
               ]
       )
    ++ ( B.bimap withShiftMod windows
           <$> [ (xK_0, W.shift "10"),
                 (xK_equal, W.shift "12"),
                 (xK_minus, W.shift "11")
               ]
       )

myConfig =
  def
    { modMask = modKey,
      terminal = "kitty",
      focusFollowsMouse = False,
      borderWidth = 0,
      workspaces = map show [1 .. 12],
      logHook = dynamicLogString def >>= xmonadPropLog
    }
    `additionalKeys` keyMappings

main = xmonad . ewmhFullscreen . ewmh =<< xmobar myConfig
