From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Fri, 20 Mar 2015 12:12:58 -0700
Message-ID: <20150320191258.GW32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <20150312105824.GD30145@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150312105824.GD30145@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2015 at 10:58:24AM +0000, Mark Rutland wrote:
> On Wed, Mar 11, 2015 at 09:57:25PM +0000, Brian Norris wrote:
> > Almost all flash that are "compatible" with m25p80 support the JEDEC
> > READ ID opcode (0x95), and in fact, that is often the only thing that is
> > used to differentiate them. Let's add a compatible string that
> > represents this lowest common denominator of compatibility.
> > 
> > Device trees can still specify manufacturer/device names in addition,
> > but (until some reason is found to differentiate between them through
> > device tree) software will likely want to bind just against the generic
> > name, and avoid unnecessarily growing its device ID binding tables.
> > 
> > This is related to the work of commit a5b7616c55e1 ("mtd:
> > m25p80,spi-nor: Fix module aliases for m25p80"), which showed that
> > maintaining these device tables as stable device-tree/modalias binding
> > tables is not a worthwhile burden for mostly-comptatible flash.
> > 
> > At the same time, let's update the binding doc to point to the
> > m25p_ids[] ID list instead of spi_nor_ids[]. The former can be used for
> > device tree bindings, but the latter cannot. In the future, we should
> > pare down the m25p_ids[] list to only those IDs which are actually used
> > in device trees.
> 
> We really should not be referring to C files for the binding. The right
> fix is to define the list in the binding document.

Yes, and that is an eventual goal I suppose, but the current list is
excessive and is most likely not currently relied on by any one. So I
don't just want to C&P the entire list into this binding immediately.

I guess my plan looks like this:

1. add "nor-jedec" binding, to provide lowest common denominator binding
(this series)

2. stop adding to the m25p_ids[] table unless necessary (enabled by this
series)

3. gauge whether we can remove certain entries from m25p_ids[] (e.g., if
they were only used in platform_data, not DT; or if they were very
recently added just to synchronize with spi-nor.c)

4. once m25p_ids[] contains a reasonable set, maintain it in the binding
doc, like we really should

I don't feel like step 4 is ready yet.

Is that a reasonable plan in your eyes?

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
