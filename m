From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Question] Memory attribute reserved by Device Tree?
Date: Thu, 30 Jun 2016 13:26:26 +0100
Message-ID: <20160630122554.GC20363@leverpostej>
References: <CAK7LNATGoP-Wn-wiK_CgD_v=rQXyt937qRvr8LkUQ06jHB7FAA@mail.gmail.com>
 <577504D7.7080106@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <577504D7.7080106-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 30, 2016 at 12:39:03PM +0100, Robin Murphy wrote:
> On 30/06/16 12:10, Masahiro Yamada wrote:
> > Hello.
> > 
> > Which memory attribute will ARM/ARM64 Linux
> > set to the memory region reserved by
> > /memreserve/ of Device Tree?
> > 
> > 
> > Normal memory non-cacheable?
> > Or, cacheable?
> > Or, not defined?
> > 
> > Perhaps actual behavior depends on whether the reserved area is
> > located in the low-memory region?
> 
> Isn't the point of memreserve that the kernel avoids mapping it at all?

Not quite. A /memreserve/ allows the kernel to map a region, so long as
it doesn't use the region for general allocation.

While not strictly defined for arm64 today, in practice the kernel may
map a region with Normal Inner-Shareable Inner-WB Outer-WB attributes,
following similar behaviour for PPC as defined in ePAPR.

Generally I would advise against the use of a memreserve, and favour
carving memory out of memory nodes as required, as that imposes stricter
requirements.

> If a reserved region is later mapped in by a driver using
> dma_declare_coherent_memory(), ioremap(), memremap() or whatever else,
> then the attributes will vary depending on the exact method used.

Indeed. This applies even with the above.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
