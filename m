From: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Subject: Re: [PATCH 0/2] Revert support for reserved memory regions defined in
 device tree
Date: Wed, 30 Oct 2013 12:30:50 -0500
Message-ID: <CAHCPf3u1mQqNQLdWF0ihw9f98k1nuEyw=TNzJRNQdCx1aW5QCw@mail.gmail.com>
References: <1381476448-14548-1-git-send-email-m.szyprowski@samsung.com>
	<20131030134702.19B57C402A0@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131030134702.19B57C402A0-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 30, 2013 at 8:47 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>
> Hi Marek,
>
> Properties:
> Requires either a) or b) below.
> a) static allocation
>    reg (required) - standard definition
> b) dynamic allocation
>    size (required) - length based on parent's #size-cells
>                    - Size in bytes of memory to reserve.
>
>    alignment (optional) - length based on parent's #size-cells
>                         - Address boundary for alignment of allocation.
>    alloc-ranges (optional) - prop-encoded-array (address, length pairs).
>                            - Specifies regions of memory that are
>                              acceptable to allocate from.

"available"?

Let's not reinvent the wheel, if at all possible. "available" has a
well defined nature (exactly as you described).

I still say device_type = "reserved" fits the bill here very well.
Sure it had another intended purpose, but it does everything described
and they're easily collectible with device_type annotation than 100
different compatible properties, per-device, per-SoC, per-board..

> If both reg and size are present, then the reg property takes precedence
> and size is ignored.

What about the case where the address and size are larger than 32-bit
cells can hold, and reg cannot hold it (reg is not appropriate for any
case where #size-cells is not 1)?

In those cases (where #size-cells would be anything other than 1) reg
is not the right property to use, and another way needs to be used. If
'reg' and 'size' is present, and 'size' is bigger than the size in the
reg property, size should just override it. What would be an "error"
is if the size in the reg property was anything other than 0 if the
size property would override it (this would reduce mis-parsing).
Otherwise how would you carve out 8GiB on a system with 64GiB (which
is eminently possible with LPAE)? reg handles the "phys.hi phys.lo
size" case and that's about it for >32-bit addressing.

> Additional properties:
> compatible (optional) - standard definition
>     - may contain the following strings:
>         - shared-dma-pool: This indicates a region of memory meant to be
>           used as a shared pool of DMA buffers for a set of devices. It can
>           be used by an operating system to instanciate the necessary pool
>           management subsystem if necessary.
>         - vendor specific string in the form <vendor>,[<device>-]<usage>

So, the only way the memory parsers you're suggesting can pull these
out is based on the idea that they're children of whatever node had
"reserved-memory" as it's "name" property?

Don't we, and haven't we always, said matching against the "name"
property is evil, evil, don't do it?

> no-map (optional) - empty property
>     - Indicates the operating system must not create a virtual mapping
>       of the region as part of its standard mapping of system memory,
>       nor permit speculative access to it under any circumstances other
>       than under the control of the device driver using the region.
> reusable (optional) - empty property
>     - The operating system can use the memory in this region with the
>       limitation that the device driver(s) owning the region need to be
>       able to reclaim it back. Typically that means that the operating
>       system can use that region to store volatile or cached data that
>       can be otherwise regenerated or migrated elsewhere.
>
> Linux implementation note:
> - If a "linux,cma-default" property is present, then Linux will use the
>   region for the default pool of the contiguous memory allocator.

CMA should just pick up shared-dma-pool, reusable, and take that as a
given, rather than having a magic property to go look for. In this
case, why not ditch "shared-dma-pool" as a compatible and just have a
"shared" property? "shared", "reusable" fits CMA nicely - any memory
CMA has "carved out" will get used for buffer caches etc. under memory
pressure anyway if it's transient data.

>         reserved-memory {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges;
>
>                 display_reserved: framebuffer@78000000 {
>                         reg = <0x78000000 0x800000>;
>                 };
>
>         };
>
>         /* ... */
>
>         fb0: video@12300000 {
>                 memory-region = <&display_reserved>;
>                 /* ... */
>         };

In this case, it makes absolutely no sense for the reserved node to
even HAVE a compatible property, does it?

-- 
Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
