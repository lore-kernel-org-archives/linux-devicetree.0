From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 18:27:13 +0100
Message-ID: <20170112172713.GF13342@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
 <1484235315.2492.41.camel@kernel.crashing.org>
 <1484238577.2492.45.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484238577.2492.45.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 10:29:37AM -0600, Benjamin Herrenschmidt wrote:
> So I think the best approach here is:
> 
> 	- A pair of ioctls to read and write random registers in the
> LPC bridge for all the "generally configuration gunk". These have a
> filter to ensure that the registers controlling the above mapping
> cannot be accessed that way.
> 
> 	- An ioctl to control the above mapping window. It takes as
> arguments the location in LPC space, the window type (flash vs.
> memory), for memory, maybe an ID (several windows to chose from), and
> the offset& size in the latter. The driver can enforce that the windows
> are one of the specially reserved areas of memory etc...
> 
> 	- An mmap function to map those reserved windows into userspace
> so the daemon can communicate appropriately (only needed for the memory
> windows, the flash space is accessed via the normal /dev/mtd drivers)
> 
> Greg, does that make sense ?

Yes, that makes a lot more sense to me.  Thanks for writing it up,
hopefully it survives into the next driver submission, otherwise I'll
ask the same questions again due to not having a short-term memory at
all :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
