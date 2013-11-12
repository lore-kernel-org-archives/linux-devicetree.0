From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH v3 3/3] DT: proc: Add runtime overlay interface in /proc
Date: Tue, 12 Nov 2013 09:40:38 +0100
Message-ID: <86657251-2872-4FB2-B71A-519A685B458A@antoniou-consulting.com>
References: <1383923170-24914-1-git-send-email-panto@antoniou-consulting.com> <1383923170-24914-4-git-send-email-panto@antoniou-consulting.com> <20131111184736.3DE20C4234E@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131111184736.3DE20C4234E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Becker <jlbec-aKy9MeLSZ9dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Nov 11, 2013, at 7:47 PM, Grant Likely wrote:

> On Fri,  8 Nov 2013 17:06:10 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>> Add a runtime interface to /proc to enable generic device tree overlay
>> usage.
>> 
>> Two new /proc files are added:
>> 
>> /proc/device-tree-overlay & /proc/device-tree-overlay-status
>> 
>> /proc/device-tree-overlay accepts a stream of a device tree objects and
>> applies it to the running kernel's device tree.
>> 
>> 	$ cat ~/BB-UART2-00A0.dtbo >device-tree-overlay
>> 	overlay_proc_release: Applied #2 overlay segments @0
>> 
>> /proc/device-tree-overlay-status displays the the overlays added using
>> the /proc interface
>> 
>> 	$ cat device-tree-overlay-status
>> 	0: 861 bytes BB-UART2:00A0
>> 
>> The format of the status line is
>> 	<ID>: <SIZE> bytes <part-number>:<version>
>> 
>> <ID> is the id of the overlay
>> <SIZE> is the size of the overlay in bytes
>> <part-number>, <version> are (optional) root level properties of the DTBO
>> 
>> You can remove an overlay by echoing the <ID> number of the overlay
>> precedded with a '-'
>> 
>> So
>> 	$ echo "-0" >device-tree-overlay-status
>> 
>> Removes the overlay.
>> 
>> Note that this seldom works on most platforms since platform_device
>> removal is something that almost never works without extra patches.
>> 
>> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> 
> Why /proc? Did you consider using the firmware loading mechanism? While
> I expressed concerned about the capebus approach, the loading of
> overlays needs to remain under the control of either a driver or the
> platform. By default it should not be possible to drop an arbitrary
> overlay into /proc/device-tree-overlay and have things change in the
> base tree. Along the same lines, I would expect for the device driver or
> platform to be able to filter or limit the parts of the tree that are
> allowed to be modified.
> 

The firmware loading mechanism is the preferred way to handle it, and is
in fact what is used in practice by the whole cape manager mechanism.
But that's part of specific board support, and this is more like a general
way to use overlays, in any kind of DT enabled system.

I agree this is a) completely dangerous and b) /proc is a bad place to put
it. I put it here in order to get the ball rolling, about the proper place
to put device tree related interfaces.

The good thing about this interface is that it's always available, and
it is good for debugging (especially loading/unloading debugging).
 

> A side benefit of the firmware loader is that the kernel can obtain the
> overlay on its own if needed at boot time without userspace involvement.
> 

Yes, that is correct, and it is the way we use it on the beaglebone.
The root fs device is present on a overlay, which is built into the kernel's
firmware.


> g.
> 

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
