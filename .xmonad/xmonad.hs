import Data.Bifunctor as B
import Graphics.X11.ExtraTypes.XF86
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

withoutMod :: KeySym -> (KeyMask, KeySym)
withoutMod k = (0, k)

withControl :: KeySym -> (KeyMask, KeySym)
withControl k = (controlMask, k)

volumeNotification = "$(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1)"

volumeToggle =
  "amixer set Master toggle && amixer get Master | grep -Fq '[off]' && volnoti-show -m || volnoti-show " <> volumeNotification

volumeChange :: Char -> String
volumeChange sign =
  "amixer set Master 5%" <> [sign] <> " && volnoti-show " <> volumeNotification

mediaKeysApp = "playerctl"

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
    ++ ( B.bimap withMod spawn
           <$> [ (xK_x, "firefox"),
                 (xK_c, "google-chrome-stable"),
                 (xK_y, "i3lock -c 000000 ;xset dpms force off")
               ]
       )
    ++ ( B.bimap withControl spawn
           <$> [ (xK_Print, "sleep 0.2; scrot -s")
               ]
       )
    ++ ( B.bimap withShiftMod windows
           <$> [ (xK_0, W.shift "10"),
                 (xK_equal, W.shift "12"),
                 (xK_minus, W.shift "11")
               ]
       )
    ++ ( B.bimap withoutMod spawn
           <$> [ (xF86XK_TouchpadToggle, "toggle-touchpad"),
                 (xF86XK_AudioMute, volumeToggle),
                 (xK_Print, "scrot"),
                 (xF86XK_MonBrightnessDown, "light -U 10"),
                 (xF86XK_KbdBrightnessDown, "light -s sysfs/leds/asus::kbd_backlight -U 50"),
                 (xF86XK_MonBrightnessUp, "light -A 10"),
                 (xF86XK_KbdBrightnessUp, "light -s sysfs/leds/asus::kbd_backlight -A 50"),
                 (xF86XK_AudioLowerVolume, volumeChange '-'),
                 (xF86XK_AudioRaiseVolume, volumeChange '+')
               ]
       )
    ++ ( B.bimap withoutMod (spawn . (mediaKeysApp <>))
           <$> [ (xF86XK_AudioPlay, " play-pause"),
                 (xF86XK_AudioPrev, " previous"),
                 (xF86XK_AudioNext, " next")
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
