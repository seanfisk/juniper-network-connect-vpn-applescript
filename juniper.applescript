#!/usr/bin/osascript

-- Juniper Network Connect manipulation script
-- Author: Sean Fisk
-- References:
-- * <http://scdidadm.tumblr.com/post/5579178924/juniper-network-connect-applescript-start-stop>
-- * <http://hintsforums.macworld.com/showthread.php?t=99264>

-- Usage: juniper gatewayHostName username password

property appName : "Network Connect"

on run argv
	if (count of argv) is not equal to 3 then
		-- FIXME: even returning here still starts Network Connect... the return apparently only returns from the if statement. Not sure how to fix yet.
		return "Usage: juniper.applescript gatewayHostName username password"
	end if
	-- `password' is a keyword, so don't use it as a variable name.
	set {gatewayHostName, username, pw} to argv
	-- Cannot use the `appName' property in this tell statement for some reason
	tell application "Network Connect"
		if connected then
			sign out
			-- Need to give Network Connect time to log out. If not, it will bother us next time with the "Continue the session" stuff. That's more buttons to click, so let's log out the right way.
			delay 5
			quit
		else
			connect to gatewayHostName
			delay 5
			tell application "System Events"
				set value of text field 1 of group 6 of UI element 1 of scroll area 1 of window appName of application process appName to username
				set value of text field 1 of group 9 of UI element 1 of scroll area 1 of window appName of application process appName to pw
				click button "Sign In" of group 13 of UI element 1 of scroll area 1 of window appName of application process appName
				-- AppleScript prints the last object that's returned. We don't want it to print the button that it fetched, so just return nothing.
				return
			end tell
		end if
	end tell
end run
