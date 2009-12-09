--
-- This will be my beloved window manager!
-- nagi
--
import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad hiding (Tall)
import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutHints
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run
import Graphics.X11
import System.Exit
import System.IO
import XMonad.Actions.UpdatePointer

main = do
     h <- spawnPipe ("dzen2" ++ " " ++ flags)
     xmonad $ defaultConfig {
            manageHook = manageDocks <+> manageHook defaultConfig,
            layoutHook = avoidStruts $ layoutHook defaultConfig,
            logHook    = dynamicLogWithPP $ myPP h,
            modMask    = mod4Mask,
            terminal   = "uxterm",
            workspaces = workspaces',
            focusFollowsMouse=True
            } `additionalKeys` keys'
            where
                fg    = "'grey70'"
                bg    = "'#2c2c32'"
                fn    = "'-*-fixed-*-*-*-*-12-*-*-*-*-*-*'"
                flags = "-e '' -w 1680 -h 16 -ta l -fg " ++ fg ++ " -bg " ++ bg ++ " -fn " ++ fn

keys' = [((mod4Mask .|. shiftMask, xK_z), spawn "xlock -mode matrix"),
         ((controlMask, xK_Print), spawn "scrot -s"),
         ((0, xK_Print), spawn "scrot"),
         ((controlMask, xK_F3), spawn "setxkbmap mn"),
         ((controlMask, xK_F9), spawn "setxkbmap mn"),
         ((mod4Mask, xK_F9), spawn "setxkbmap mn"),
         ((controlMask, xK_F2), spawn "setxkbmap us"),
         ((controlMask, xK_F8), spawn "setxkbmap us"),
         ((mod4Mask, xK_F8), spawn "setxkbmap us"),
         ((controlMask, xK_F4), spawn "setxkbmap de"),
         ((mod4Mask, xK_u ), spawn "uxterm"),
         ((mod4Mask, xK_F7), moveTo Next EmptyWS),
         ((mod4Mask, xK_F11), spawn "setxkbmap mn" >> toggleWS),
         ((mod4Mask, xK_F10), spawn "setxkbmap us" >> toggleWS)
        ]

-- shamelessly stolen from Xilon's confi
myPP handle = defaultPP {
                ppCurrent = wrap ("^fg(" ++ myFocusedFGColor ++ ")^bg(" ++ myFocusedBGColor ++ ")^p(4)") "^p(4)^fg()^bg()",
                ppUrgent = wrap ("^fg(" ++ myUrgentFGColor ++ ")^bg(" ++ myUrgentBGColor ++ ")^p(4)") "^p(4)^fg()^bg()",
                ppVisible = wrap ("^fg(" ++ myNormalFGColor ++ ")^bg(" ++ myNormalBGColor ++ ")^p(4)") "^p(4)^fg()^bg()",
                ppSep     = "^fg(" ++ mySeperatorColor ++ ")^r(3x3)^fg()",
                ppTitle   = wrap (" ^fg(" ++ myFocusedFGColor ++ ")") "^fg()" ,
                ppOutput  = hPutStrLn handle
}


-- Color, font and iconpath definitions:
myNormalBGColor = "#2e3436"
myFocusedBGColor = "#414141"
myNormalFGColor = "#babdb6"
myFocusedFGColor = "#73d216"
myUrgentFGColor = "#f57900"
myUrgentBGColor = myNormalBGColor
mySeperatorColor = "#2e3436"

myFont = "-xos4-terminus-medium-r-normal-*-14-*-*-*-c-*-iso10646-1"
myIconDir = "/home/nagi/.dzen"
myDzenFGColor = "#555555"
myDzenBGColor = ""
--myNormalFGColor = "#ffffff"
--myNormalBGColor = "#0f0f0f"
--myFocusedFGColor = "#f0f0f0"
--myFocusedBGColor = "#333333"
--myUrgentFGColor = "#0099ff"
--myUrgentBGColor = "#0077ff"
myIconFGColor = "#777777"
myIconBGColor = ""
--mySeperatorColor = "#555555"

workspaces' = map show [1 .. 13 :: Int]
