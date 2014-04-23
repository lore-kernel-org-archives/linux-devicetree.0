From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Generating .config from device tree [was Re: Hardware dependencies
 in Kconfig] (fwd)
Date: Wed, 23 Apr 2014 19:46:10 +0200
Message-ID: <20140423174610.GB24243@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just heads-up. Original message with attachment should be reachable on
lkml.

								Pavel

----- Forwarded message from Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> -----

Date: Wed, 23 Apr 2014 19:45:14 +0200
From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>,
	Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>,
	Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
Subject: Generating .config from device tree [was Re: Hardware dependencies
	in Kconfig]
User-Agent: Mutt/1.5.20 (2009-06-14)

Hi!

> Ideally, the arch doesn't matter at all for a driver, only the
> infrastructure the driver depends on does.  So perhaps the

Actually, it would be nice if user was never asked for combination
that can be compiled, and kernel would support them, but there's no
such hardware.

For example, if I am configuring for Nokia N900, I pretty much know
all the devices -- not even USB host is officially supported, so this
machine is not extensible. Yet I'll have to answer about 1000
questions about config.

And ... we already have very accurate description of what hardware
Nokia N900 has -- in the device tree. Perhaps it would make sense to
generate hardware-dependend parts of config from device tree? [I'll
still need to answer questions like CONFIG_NFS but should
not have to answer CONFIG_DISPLAY_PANEL_SONY_ACX565AKM question.]

Anyway, script is attached, perhaps it is useful to someone. 

[And yes, I believe we should build CONFIG_FOO corresponds to
"ti,omap3-foo" database.]

Run it from linux directory, and modify 

        m.linux_path = "/data/l/linux-n900/"
        m.dtb_path = "arch/arm/boot/dts/omap3-n900.dtb"

to match your configuration.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

#!/usr/bin/python
#
# Scripts for automatic kernel configuration from dts
# 
# Copyright 2014 Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
# Distribute under GPLv2+
#

import os
import re

class DtsParser():
    def __init__(m):
        m.linux_path = "/data/l/linux-n900/"
        m.dtb_path = "arch/arm/boot/dts/omap3-n900.dtb"

    def find_files(m, match):
        l = os.popen("find "+m.linux_path+" -name '"+match+"'").readlines()
        return map(lambda s: s.rstrip(), l)
        

    def find_compatible(m):
        dts = os.popen("dtc -I dtb "+m.dtb_path).readlines()
        compatibles = {}
        for line in dts:
            match = re.match(".*compatible = ([^;]*);", line)
            if not match:
                continue
            l = match.group(1)
            for s in l.split('",'):
                s = re.sub('^[" ]*', '', s)
                s = re.sub('"$', '', s)
                compatibles[s] = 1

        m.compatibles = compatibles


    def find_drivers(m):
        drivers = {}
        for fname in m.find_files("*.c"):
            for line in open(fname, "r").readlines():
                for c in m.compatibles:
                    if re.match('.*"'+c+'".*', line):
                        m.compatibles[c] = 2
                        if not fname in drivers:
                            drivers[fname] = []
                        drivers[fname] += [ line ]
        m.drivers = drivers

    def find_configs(m):
        configs = {}
        m.found_drivers = {}
        for fname in m.drivers:
            makefile = fname.rstrip("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-.,_")
            makefile += "Makefile"
            basename = re.match("^.*/([a-zA-Z0-9-_,]*).c$", fname)
            if not basename:
                print "Can't find basename for ", fname
                continue
            basename = basename.group(1)
            print basename

            lines = open(makefile, "r").readlines()
            for l in lines:
                l = l.rstrip()
                c = re.match("^obj-\$\(([A-Z0-9_]*)\)[ 	]*\+= "+basename+".o$", l) 
                if c:
                    break
            if not c:
                print "Could not file config option for ", basename, " in ", makefile
                continue
            c = c.group(1)
            print "Have config option ", c
            configs[c] = fname
            m.found_drivers[fname] = c
        m.configs = configs

    def run(m):
        m.find_compatible()
        m.find_drivers()
        m.find_configs()

    def print_configs(m):
        for c in m.configs:
            print c
        for c in m.compatibles:
            if m.compatibles[c] != 2:
                print "Could not find driver for ", c
        
parser = DtsParser()
parser.run()
parser.print_configs()


#print parser.find_files("*.c")



----- End forwarded message -----

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
