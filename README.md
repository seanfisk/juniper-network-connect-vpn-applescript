# Automated Juniper Network Connect VPN AppleScript

![Screenshot](https://seanfisk.github.com/juniper-network-connect-vpn-applescript)

This is a script that will assist you in automating your VPN connection using Network Connect by [Juniper Networks][juniper]. It was designed for VPN access at [Grand Valley State University][gvsu], but contains nothing GVSU-specific. It should hopefully work for all versions of Network Connect on Mac OS X, but it has tested on GVSU's student VPN with Mac OS 10.6 Snow Leopard.

[juniper]: http://www.juniper.net
[gvsu]: http://gvsu.edu/

## Recommended Installation

There are a number of ways to use this AppleScript. This is the way I recommend.

Create a `bin` directory for yourself if you don't already have it, and add it to your `PATH`:

    mkdir ~/bin
    echo 'export PATH=~/bin:"$PATH"' >> ~/.bashrc

Next, download the script:

    curl https://raw.github.com/seanfisk/juniper-network-connect-vpn-applescript/master/juniper.applescript > ~/bin/juniper

Make it executable:

    chmod +x ~/bin/juniper

You can now use the script like so:

    juniper my.gateway.example.com myusername mypassword

The script will detect whether you are connected to the VPN. If not connected, it will start Network Connect and attempt to connect. If connected, it will sign out of the connection and quit Network Connect.

## Shell Function

The previous instructions get it working, but don't really automate much. I wanted to be able to log in to the VPN by simply typing `vpn` at the terminal. I don't type passwords for websites or SSH, so I shouldn't have to type it for a VPN either. Add this shell function to your `.bashrc` to complete the configuration:

    vpn () {
	  juniper my.gateway.example.com myusername mypassword &
    }

It is backgrounded so you don't have to wait for the delay and get your shell back immediately.

## GVSU

As mentioned, this was created for use with GVSU's VPN. If you are a GVSU user, please use these command lines.

### Student

    juniper vpn.student.gvsu.edu studentusername studentpassword

See more about connecting in the [GVSU VPN guide for students][vpn-student].

### Faculty

    juniper vpn.gvsu.edu facultyusername facultypassword

See more about connecting in the [GVSU VPN guide for faculty][vpn-faculty].

[vpn-student]: http://www.gvsu.edu/cms3/assets/428A2C9A-0FB7-5B0C-BBFCF723C12E59E3/VPN-AccessforGVSUStudents.pdf
[vpn-faculty]: http://www.gvsu.edu/cms3/assets/FCC6FA7C-C5D2-3528-127B6819D54A9210/pdfs/network/vpn_connection_gvsu_machine.pdf

## Credits

This AppleScript drew from two other scripts created for this purpose:

* <http://scdidadm.tumblr.com/post/5579178924/juniper-network-connect-applescript-start-stop>
* <http://hintsforums.macworld.com/showthread.php?t=99264>

I also used a script from Macworld to help determine the "addresses" of the UI fields and button:

* <http://hints.macworld.com/article.php?story=20111208191312748>

That script is also committed as `dumpobjects.applescript`.
