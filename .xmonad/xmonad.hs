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

doCopyToAll = ask >>= doF . \w -> (\ws -> foldr($) ws (map (copyWindow w) myWorkspaces))

myManageHook = composeAll (
	[ manageHook gnomeConfig
	, className =? "Unity-2d-panel" --> doIgnore
	, className =? "Unity-2d-launcher" --> (doFloat <+> doCopyToAll)
	])

myLayouts = gaps [(U, 24)]

main = xmonad $ gnomeConfig
	{ layoutHook = myLayouts $ smartBorders $ layoutHook gnomeConfig
	, manageHook = manageHook gnomeConfig <+> myManageHook
	, workspaces = myWorkspaces
	} 

