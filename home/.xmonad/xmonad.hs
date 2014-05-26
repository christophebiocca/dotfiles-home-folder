import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

main = xmonad xfceConfig
    { modMask = mod4Mask
    , manageHook = manageDocks
        <+> composeAll
            [ isFullscreen --> doFullFloat
            , className =? "Xfce4-notifyd" --> doIgnore
            ]
        <+> manageHook defaultConfig
    }
