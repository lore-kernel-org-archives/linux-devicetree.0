From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 3/3] DT: proc: Add runtime overlay interface in /proc
Date: Thu, 7 Nov 2013 09:44:23 +0200
Message-ID: <22F5FEA8-8ED8-4F3D-98F0-6689E0A1B091@antoniou-consulting.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <1383676898-29819-4-git-send-email-panto@antoniou-consulting.com> <CAL_Jsq+k9NoHxOaNujTG2=0MHm=s4Mh+xhXCZbhPG1EnHvo50A@mail.gmail.com> <8EBC2D5B-74A4-4A85-8BEE-9EAEBFF045D4@antoniou-consulting.com> <20131106201620.GN28156@beef>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131106201620.GN28156@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matt,

On Nov 6, 2013, at 10:16 PM, Matt Porter wrote:

> On Wed, Nov 06, 2013 at 09:24:12PM +0200, Pantelis Antoniou wrote:
>> Hi Rob,
>> 
>> On Nov 6, 2013, at 9:10 PM, Rob Herring wrote:
>> 
>>> On Tue, Nov 5, 2013 at 12:41 PM, Pantelis Antoniou
>>> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>> Add a runtime interface to /proc to enable generic device tree overlay
>>>> usage.
>>>> 
>>>> Two new /proc files are added:
>>>> 
>>>> /proc/device-tree-overlay & /proc/device-tree-overlay-status
>>> 
>>> I think we really want all this to live under sysfs. Grant did patches
>>> to move /proc/device-tree to /sys, but it never went upstream:
>>> 
>>> v2: https://lkml.org/lkml/2013/3/21/215
>>> v1: https://lkml.org/lkml/2013/3/20/311
>>> 
>> 
>> Yes, I'm aware; the location of this control interface in /proc is
>> unusual, but had to go somewhere. It should be easy enough to move it to
>> /sys.
>> 
>>>> /proc/device-tree-overlay accepts a stream of a device tree objects and
>>>> applies it to the running kernel's device tree.
>>>> 
>>>>       $ cat ~/BB-UART2-00A0.dtbo >device-tree-overlay
>>>>       overlay_proc_release: Applied #2 overlay segments @0
>>>> 
>>>> /proc/device-tree-overlay-status displays the the overlays added using
>>>> the /proc interface
>>>> 
>>>>       $ cat device-tree-overlay-status
>>>>       0: 861 bytes BB-UART2:00A0
>>> 
>>> Is the size useful information?
>>> 
>> 
>> If the overlay doesn't contain part-number/version properties there is nothing
>> to differentiate each one loaded. No file information, it is just a byte stream
>> interface.
>> 
>>>> 
>>>> The format of the status line is
>>>>       <ID>: <SIZE> bytes <part-number>:<version>
>>>> 
>>>> <ID> is the id of the overlay
>>>> <SIZE> is the size of the overlay in bytes
>>>> <part-number>, <version> are (optional) root level properties of the DTBO
>>>> 
>>>> You can remove an overlay by echoing the <ID> number of the overlay
>>>> precedded with a '-'
>>>> 
>>>> So
>>>>       $ echo "-0" >device-tree-overlay-status
>>>> 
>>>> Removes the overlay.
>>> 
>>> This interface seems racy. Could the id change on you between reading
>>> the status and echoing to remove the overlay?
>>> 
>>> I would rather see a file created for each overlay and simply echo 0
>>> or "remove" to remove the overlay. Or possibly it needs to be a
>>> directory per overlay with several files for info and control. This
>>> would be more inline with typical sysfs design.
>>> 
>> 
>> It was suggested to use a configfs interface. IIRC configfs can do what you
>> propose.
>> 
>> Something like 
>> 
>> /config/dto/add 	<- load by cat overlay.dtbo >/config/dto/load
> 
> In a configfs it makes more sense to mkdir. FWIW, USB gadget configfs
> is a good example of this.
> 
> 	mkdir /config/dto/0
> 
> which would cause the kernel to create the attribute under that
> directory:
> 
> 	/config/dto/0/load
> 
> Which you use to load as noted above.
> 

I see. This can be made to work.

> Only problem is that configfs doesn't support binary attributes like
> sysfs. If it is a agreed that overlays are configuration then that would
> be a strong argument to bring over the binary attribute feature.
> 
> 

Oops...

>> /config/dto/0/remove 	<- unload by echo 1 >/config/dto/0/remove
> 
> 	rmdir /config/dto/0
> 
>> /config/dto/0/${prop}   <- root level properties that are ignore by the overlay
>> 			   mechanism
> 

Oh well, let's see what the maintainer have to say about which way to do.
Any option of the tree presented would work fine.

> -Matt

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
