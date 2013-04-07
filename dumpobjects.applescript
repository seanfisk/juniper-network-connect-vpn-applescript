#!/usr/bin/osascript
-- Credit: <http://hints.macworld.com/article.php?story=20111208191312748>

-- Entire Contents Demo - mini
-- BP ages ago or so

-- This'll get all the controls and structures associated with an App's window and menus
-- In a form which is easily pasteable into your own scripts
-- and show them in the result pane below.
--
-- Copy that into a text editor and change commas to returns to get an easily  readable list.
--
-- The script can take a long time if there are LOTS of window items, such as
-- in the "music" pane of iTunes. It may even time out if you have a huge iTunes library
-- The script'll process most App's UI structures in under a minute

set appname to "Network Connect" -------------------------- Set this to the App you want to look at

set winstuff to "defaultval"
set menustuff to "defaultval"

tell application appname
  activate
end tell

tell application "System Events"
  tell process appname
    set winstuff to entire contents of front window
    set menustuff to entire contents of menu bar 1
  end tell
end tell
--return winstuff & "rrrr" & menustuff -- comment this out to get just winstuff
return winstuff -- comment this out too to get just menustuff
--return menustuff 