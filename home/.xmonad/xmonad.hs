import Data.List
import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Config.Gnome
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig

myWorkspaces = workspaces gnomeConfig

myManageHook = composeAll (
	[ manageHook gnomeConfig
	, className =? "Unity-2d-panel" --> doIgnore
        , className =? "Do" --> doFloat
	])

main = xmonad $ gnomeConfig
	{ layoutHook = smartBorders $ layoutHook gnomeConfig
	, manageHook = manageHook gnomeConfig <+> myManageHook
	, workspaces = myWorkspaces
        , modMask = mod5Mask
	} 

