From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dma: of: introduce of_dma_is_coherent() helper
Date: Mon, 3 Mar 2014 01:49:01 +0000
Message-ID: <20140303014901.GA18773@localhost>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
 <1393535872-20915-5-git-send-email-santosh.shilimkar@ti.com>
 <10040083.PbPEQQPCjl@wuerfel>
 <53109A64.9030701@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53109A64.9030701-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 28, 2014 at 09:17:08AM -0500, Santosh Shilimkar wrote:
> On Friday 28 February 2014 04:39 AM, Arnd Bergmann wrote:
> > On Thursday 27 February 2014 16:17:49 Santosh Shilimkar wrote:
> >> +
> >> +/**
> >> + * of_dma_is_coherent - Check if device is coherent
> >> + * @np:        device node
> >> + *
> >> + * It returns true if "dma-coherent" property was found
> >> + * for this device in DT.
> >> + */
> >> +bool of_dma_is_coherent(struct device_node *np)
> >> +{
> >> +       struct device_node *node = np;
> >> +
> >> +       while (node) {
> >> +               if (of_property_read_bool(node, "dma-coherent")) {
> >> +                       of_node_put(node);
> >> +                       return true;
> >> +               }
> >> +               node = of_get_next_parent(node);
> >> +       }
> >> +       return false;
> >> +}
> >> +EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> >>
> > 
> > This won't work on architectures that are always coherent and
> > did not need 'dma-coherent' properties before, such as IBM
> > Power servers.
> > 
> > That said, I think the property makes sense, and we already have
> > platforms using it (highbank is the one I'm aware of).
> > 
> > We probably need ways to override this function in both ways:
> > "always coherent" (powerpc, x86), and "never coherent" (keystone
> > without LPAE) from platform code, and it would be nice to put
> > either option into DT in a global location as well. We may have
> > to go through a few iterations of this patch to get the best
> > algorithm, but I think the interface is good at least.
> 
> Probably we should discuss bit more next week at connect. The
> current 'dma-coherent' is a per device property. For arch's
> which are always coherent, the per device property doesn't make
> sense.
> 
> BTW, the current users of this API is only ARM32 bit port
> and if this satisfies the ARM platforms, we should get
> this in kernel and then address other cases on need
> basis.

I have a suspicion that we'll need this API on arm64 at some point as
well. I get regular questions about DMA cache maintenance for arm64 and
I carried a patch in my tree for a long time (now in -next). While full
coherency is nice, there are some devices on certain SoCs that are more
efficient (power, speed) when they don't have to snoop the CPU caches.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
