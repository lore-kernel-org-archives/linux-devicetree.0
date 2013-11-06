From: Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH 3/3] DT: proc: Add runtime overlay interface in /proc
Date: Wed, 06 Nov 2013 10:51:43 +0100
Message-ID: <527A112F.6070908@nsn.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <1383676898-29819-4-git-send-email-panto@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383676898-29819-4-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 05.11.2013 19:41, ext Pantelis Antoniou wrote:
> Add a runtime interface to /proc to enable generic device tree overlay
> usage.
> 
> Two new /proc files are added:
> 
> /proc/device-tree-overlay & /proc/device-tree-overlay-status
> 
> /proc/device-tree-overlay accepts a stream of a device tree objects and
> applies it to the running kernel's device tree.
> 
> 	$ cat ~/BB-UART2-00A0.dtbo >device-tree-overlay
> 	overlay_proc_release: Applied #2 overlay segments @0
> 
> /proc/device-tree-overlay-status displays the the overlays added using
> the /proc interface
> 
> 	$ cat device-tree-overlay-status
> 	0: 861 bytes BB-UART2:00A0
> 
> The format of the status line is
> 	<ID>: <SIZE> bytes <part-number>:<version>
> 
> <ID> is the id of the overlay
> <SIZE> is the size of the overlay in bytes
> <part-number>, <version> are (optional) root level properties of the DTBO
> 
> You can remove an overlay by echoing the <ID> number of the overlay
> precedded with a '-'
> 
> So
> 	$ echo "-0" >device-tree-overlay-status
> 

Wouldn't it be easier if echo "-BB-UART2-00A0" > device-tree-overlay-status was
supported also? That way one doesn't need to know the order in which the
overlays were applied or parse the status file to get the <ID>.

> Removes the overlay.
> 
> Note that this seldom works on most platforms since platform_device
> removal is something that almost never works without extra patches.
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>

It would be very helpful to me if I would have a notification mechanism
for overlay add and remove operations based on blocking_notifier_call_chain(),.
This way other drivers can be notified when the dt changes.

But I guess that could be added in the future with another patch.

Thanks,
Ionut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
