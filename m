From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [RFC] Add of_path property for all devices with a node
Date: Fri, 07 Nov 2014 17:33:51 +1100
Message-ID: <1415342031.4925.27.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hey folks ! This is not (yet) a formal patch submission but...

So I've been annoyed lately with having a bunch of devices such as i2c
eeproms (for use by VPDs, server world !) and other bits and pieces that
I want to be able to identify from userspace, and possibly provide
additional data about from FW.

Basically, it boils down to correlating the sysfs device with the OF
tree device node, so that user space can use device-tree info such as
additional "location" or "label" (or whatever else we can come up with)
propreties to identify a given device, or get some attributes of use
about it, etc...

Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
using "devspec" properties. For example, PCI creates them if it can
correlate the probed device with a DT node. Some powerpc specific busses
do that too.

However, i2c doesn't and it would be nice to have something more generic
since technically any device can have a corresponding device tree node.

So I came up with this patch, it seems to work well for me. I'm adding
an "of_path" attribute to not conflict with the existing "devspec" one
just for the sake of this experiment (plus "devspec" sucks). Long run,
we might want to use of_path and leave a "devspec" symlink to of_path on
the few busses that currently have devspec (pci and some powerpc
specific ones).

Comments ?

Cheers,
Ben.





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
