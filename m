From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 10:29:37 -0600
Message-ID: <1484238577.2492.45.camel@kernel.crashing.org>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-4-cyrilbur@gmail.com>
         <20170112074750.GB23943@kroah.com> <1484216163.11416.8.camel@gmail.com>
         <1484235315.2492.41.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484235315.2492.41.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-12 at 09:35 -0600, Benjamin Herrenschmidt wrote:
> Greg, I don't think UIO is the answer here either. Note, this isn't an
> exploit so much as root shooting itself in the foot as this driver
> should never be accessed by anybody but root, but see below.

Reading back my previous email I realize that the lack of coffee
made my prose a lot less clear than I intended it to be :-)

I think some background is in order here, it will help whoever
reviews this and Cyril, skip to the bottom to how I think you should
articulate the driver.

So on a bunch of server systems, you have a system controller typically
known as a BMC controller all sort of things such as power to various
elements, sometimes fans, often the system flash, etc...

The Aspeed BMC family which is what is used on OpenPOWER machines and a
number of x86 as well is typically connected to the host via an LPC
bus. (among others).

This is an ISA bus on steroids, it has IO and MEM/FW cycles (different
address spaces, the subtle differences between MEM and FW can be
ignored for the sake of this discussion). It's generally used by the
BMC chip to provide the host with access to the system flash that
contains the BIOS or other host firmware (via MEM/FW space) along with
a number of SuperIO-style IOs (via IO space) such as UARTs, IPMI
controllers, etc....

On the BMC chip side, this is all configured via a bunch of registers
whose content is related to a given policy of what devices are exposed
how and where on a given system, which is system/vendor specific, so we
don't want to bolt that into the BMC kernel. So this started with a
need to provide something nicer than /dev/mem for user space to
configure these things. At that point, something like UIO could have
still made sense. However...

One important aspect of the configuration is how the MEM/FW space is
exposed to the host (ie, the x86 or POWER). Some registers in that
bridge can define a window remapping all or portion of the LPC MEM/FW
space to a portion of the BMC internal bus, with no specific limits
imposed in HW.

As you can see, this can be pretty nasty. So for this, I think it makes
sense to ensure that this window is configured by a kernel driver that
can apply some serious sanity checks on what it is configured to map.

In practice, user space wants to control this by flipping the mapping
between essentially two types of portions of the BMC address space:

   - The flash space. This is a region of the BMC MMIO space that
more/less directly maps the system flash (at least for reads, writes
are somewhat more complicated).

   - One (or more) reserved area(s) of the BMC physical memory.

The latter is needed for a number of things, such as avoiding letting
the host manipulate the innards of the BMC flash controller via some
evil backdoor, we want to do flash updates by routing the window to a
portion of memory (under control of a mailbox protocol via some
separate set of registers) which the host can use to write new data in
bulk and then request the BMC to flash it. There are other uses, such
as allowing the host to boot from an in-memory flash image rather than
the one in flash (very handy for continuous integration and test, the
BMC can just download new images), etc...

So I think the best approach here is:

	- A pair of ioctls to read and write random registers in the
LPC bridge for all the "generally configuration gunk". These have a
filter to ensure that the registers controlling the above mapping
cannot be accessed that way.

	- An ioctl to control the above mapping window. It takes as
arguments the location in LPC space, the window type (flash vs.
memory), for memory, maybe an ID (several windows to chose from), and
the offset& size in the latter. The driver can enforce that the windows
are one of the specially reserved areas of memory etc...

	- An mmap function to map those reserved windows into userspace
so the daemon can communicate appropriately (only needed for the memory
windows, the flash space is accessed via the normal /dev/mtd drivers)

Greg, does that make sense ?

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
