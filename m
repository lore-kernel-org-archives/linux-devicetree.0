From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] DT: proc: Add runtime overlay interface in /proc
Date: Tue, 12 Nov 2013 10:27:47 -0500
Message-ID: <20131112152747.GL8585@beef>
References: <1383923170-24914-1-git-send-email-panto@antoniou-consulting.com>
 <1383923170-24914-4-git-send-email-panto@antoniou-consulting.com>
 <20131111184736.3DE20C4234E@trevor.secretlab.ca>
 <86657251-2872-4FB2-B71A-519A685B458A@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86657251-2872-4FB2-B71A-519A685B458A-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Becker <jlbec-aKy9MeLSZ9dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 09:40:38AM +0100, Pantelis Antoniou wrote:
> Hi Grant,
> 
> On Nov 11, 2013, at 7:47 PM, Grant Likely wrote:
> 
> > On Fri,  8 Nov 2013 17:06:10 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> >> Add a runtime interface to /proc to enable generic device tree overlay
> >> usage.
> >> 
> >> Two new /proc files are added:
> >> 
> >> /proc/device-tree-overlay & /proc/device-tree-overlay-status
> >> 
> >> /proc/device-tree-overlay accepts a stream of a device tree objects and
> >> applies it to the running kernel's device tree.
> >> 
> >> 	$ cat ~/BB-UART2-00A0.dtbo >device-tree-overlay
> >> 	overlay_proc_release: Applied #2 overlay segments @0
> >> 
> >> /proc/device-tree-overlay-status displays the the overlays added using
> >> the /proc interface
> >> 
> >> 	$ cat device-tree-overlay-status
> >> 	0: 861 bytes BB-UART2:00A0
> >> 
> >> The format of the status line is
> >> 	<ID>: <SIZE> bytes <part-number>:<version>
> >> 
> >> <ID> is the id of the overlay
> >> <SIZE> is the size of the overlay in bytes
> >> <part-number>, <version> are (optional) root level properties of the DTBO
> >> 
> >> You can remove an overlay by echoing the <ID> number of the overlay
> >> precedded with a '-'
> >> 
> >> So
> >> 	$ echo "-0" >device-tree-overlay-status
> >> 
> >> Removes the overlay.
> >> 
> >> Note that this seldom works on most platforms since platform_device
> >> removal is something that almost never works without extra patches.
> >> 
> >> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> > 
> > Why /proc? Did you consider using the firmware loading mechanism? While
> > I expressed concerned about the capebus approach, the loading of
> > overlays needs to remain under the control of either a driver or the
> > platform. By default it should not be possible to drop an arbitrary
> > overlay into /proc/device-tree-overlay and have things change in the
> > base tree. Along the same lines, I would expect for the device driver or
> > platform to be able to filter or limit the parts of the tree that are
> > allowed to be modified.
> > 
> 
> The firmware loading mechanism is the preferred way to handle it, and is
> in fact what is used in practice by the whole cape manager mechanism.
> But that's part of specific board support, and this is more like a general
> way to use overlays, in any kind of DT enabled system.
> 
> I agree this is a) completely dangerous and b) /proc is a bad place to put
> it. I put it here in order to get the ball rolling, about the proper place
> to put device tree related interfaces.
> 
> The good thing about this interface is that it's always available, and
> it is good for debugging (especially loading/unloading debugging).

As was pointed out earlier in the thread, /proc just isn't the place to
add these configuration interfaces any longer.
>  
> 
> > A side benefit of the firmware loader is that the kernel can obtain the
> > overlay on its own if needed at boot time without userspace involvement.
> > 
> 
> Yes, that is correct, and it is the way we use it on the beaglebone.
> The root fs device is present on a overlay, which is built into the kernel's
> firmware.

Let's be clear that there are two use cases here

1) kernel driven overlay loading
  - root device configuration, other early devices, kernel-based h/w
    detection

2) userspace driven overlay loading
  - s/w defined h/w, hobbyist connecting stuff on a breadboard,
    userspace arduino support

Combining a configfs api for userspace configuration of the overlay to
load with the firmware loader interface would address both of these.

As Grant noted, you want the firmware loader support to handle the
standard kernel driver initiated case which you were doing with capebus
already. But for userspace we have configuration to hand to the kernel
in the form of the name of an overlay. This configuration should be
provided via configfs.

Instantiate an overlay:

	mkdir /config/dto/0

would create the following attributes:

        /config/dto/0/overlay
	/config/dto/0/status

Start a firmware load of an overlay:

	echo "foo.dtbo" > /config/dto/0/overlay
	[loads /lib/firmware/foo.dtbo]

Status of overlay:

	cat /config/dto/0/status
	0:  861 bytes FOO:BAR0

Remove an overlay:

	rmdir /config/dto/0

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
