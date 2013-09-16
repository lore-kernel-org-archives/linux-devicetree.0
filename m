From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: "memory" binding issues
Date: Mon, 16 Sep 2013 12:57:54 +1000
Message-ID: <1379300274.4098.77.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[resent to the right list this time around]

Hi folks !

So I don't have the bandwidth to follow closely what's going on, but I
just today noticed the crackpot that went into 3.11 as part of commit:

9d8eab7af79cb4ce2de5de39f82c455b1f796963
drivers: of: add initialization code for dma reserved memory

Fist of all, do NOT add (or change) a binding as part of a patch
implementing code, it's gross.

Secondly, I don't know how much that binding was discussed on the list
(I assume it was and I just missed it) but it's gross.

It duplicates a binding that Jeremy Kerr had proposed a while ago for
a /reserved-ranges (and /reserved-names) pair of properties, possibly in
a better way but the fact is that the original binding received little
or no feedback and we went on and implemented support for it in powerpc
back in early 3.11 merge window.

Additionally, it has the following issues:

 - It describes the "memory" node as /memory, which is WRONG

It should be "/memory@unit-address, this is important because the Linux
kernel of_find_device_by_path() isn't smart enough to do partial
searches (unlike the real OFW one) and thus to ignore the unit address
for search purposes, and you *need* the unit address if you have
multiple memory nodes (which you typically do on NUMA machines).

 - To add to the above mistake, it defines "reserved memory" as a child
node of the "/memory" node. That is wrong or at least poorly thought
out. There can be several "memory" nodes, representing different areas
of memory, possibly even interleaved, having the reserved ranges as
children of a specific memory nodes thus doesn't work very well.
Breaking them up into regions based on what memory nodes they cover is
really nasty. Basically, the "reserved-memory" node should have been at
the root of the device-tree.

 - It provides no indication of what a given region is used for (or used
by). In the example, "display_region" is a label (thus information that
is lost) and unless it's referenced by another node there is no good way
to know what this region is about which is quite annoying.

 - The "memory-region" property is a phandle to a "reserved-memory"
region, this is not intuitive. If anything, the property should have
been called "reserved-memory-region".

 - The way the "compatible" property is documented breaks a basic
premise that the device-tree is a hardware description and not some
convenient way to pass linux specific kernel parameters accross. It is
*ok* to pass some linux specific stuff and to make compromise based on
what a driver generally might expect but the whole business of using
that to describe what to put in CMA is pushing it pretty far ...

 - The implementation of early_init_dt_scan_reserved_mem() will not work
on a setup whose /memory node has a unit address (typically /memory@0)

Now, I'd like to understand why not use the simpler binding originally
proposed by Jeremy, which had the advantage of proposing a unique name
per region in the traditional form "vendor,name", which then allows
drivers to pick up the region directly if they wish to query, remove or
update it in the tree for example (because they changed the framebuffer
address for example and want kexec to continue working).

I don't object to having a node per region, though it seemed unnecessary
at the time, but in any case, the current binding is crap and need to be
fixed urgently before its use spreads.

Ben.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
