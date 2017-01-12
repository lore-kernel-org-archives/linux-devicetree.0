From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 17:27:04 +0100
Message-ID: <20170112162704.GC10283@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
 <1484235315.2492.41.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484235315.2492.41.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 09:35:15AM -0600, Benjamin Herrenschmidt wrote:
> On Thu, 2017-01-12 at 21:16 +1100, Cyril Bur wrote:
> > My aim here was to only have one process playing with the LPC mapping
> > registers at a time.
> > 
> > > Again, use UIO, it will save you from yourself...
> > > 
> > 
> > Thank-you! This is the first I've heard of UIO and I'll investigate
> > furthur!
> 
> Greg, I don't think UIO is the answer here either. Note, this isn't an
> exploit so much as root shooting itself in the foot as this driver
> should never be accessed by anybody but root, but see below.
> 
> This is a BMC, ie, the system controller of a x86 or POWER based
> system.
> 
> The LPC controller controls the LPC bus which is mastered by the "host"
> (ie. the x86 or PPC) and acts as a slave on the BMC side.
> 
> It has a bunch of registers that need to be configured in more/less
> system specific ways by the BMC, but more so, it has a pair of
> registers that allow "mapping" of a region of the BMC physical address 
> space into the host address space.
> 
> This is by definition dangerous to configure since it gives you a
> window to any part of the BMC, kernel space, any IOs, etc... however it
> needs to be configured by a userspace daemon which communicates with
> the host via a mailbox in order to map either different portions of the
> system flash controller address space or reserved memory.
> 
> So in fact it should be done by the kernel, not userspace.
> 
> What Cyril needs to do to make it more secure is:
> 
>   - For random register accesses, white list what registers
> specifically are allowed (and if necessary filter values). These
> registers aren't dangerous from the BMC perspective and need to be set
> appropriately for the host to operate correctly.
> 
>   - For the mapping of the LPC FW space <-> BMC space, use ioctl's to
> explicit establish the mapping  to a portion of the flash (and nowhere
> else) or one of the known reserved memory areas. IE, dont have
> userspace just pass raw physical addresses through, but tell the kernel
> driver what portion (offset/size) of what area (flash space or reserved
> memory region) to configure the HW window for.

Yes, something more needs to be documented here, as what was proposed
isn't acceptable at all.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
