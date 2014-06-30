From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv5 1/3] ARM: mm: add support for HW coherent systems in
 PL310 cache
Date: Mon, 30 Jun 2014 20:50:59 +0200
Message-ID: <20140630205059.2e7b2278@free-electrons.com>
References: <1402585772-10405-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1402585772-10405-2-git-send-email-thomas.petazzoni@free-electrons.com>
	<20140630173217.GT28951@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140630173217.GT28951-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Catalin Marinas,

On Mon, 30 Jun 2014 18:32:17 +0100, Catalin Marinas wrote:

> > +/*
> >   * Note that the end addresses passed to Linux primitives are
> >   * noninclusive, while the hardware cache range operations use
> >   * inclusive start and end addresses.
> > @@ -1487,6 +1514,10 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
> >  
> >  	data = of_match_node(l2x0_ids, np)->data;
> >  
> > +	if (of_device_is_compatible(np, "arm,pl310-cache") &&
> > +	    of_property_read_bool(np, "arm,io-coherent"))
> > +		data = &of_l2c310_coherent_data;
> 
> I don't have a better way without duplicating the l2c_init_data
> structure since the fixup function does not take a device_node
> pointer. If it did, you could have added the check in l2c310_fixup and
> zeroed the sync pointer there.
> 
> Anyway, your approach works for me as well:
> 
> Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>

Thanks for the confirmation. Note that it comes a bit too late though:
the patch is already in 3.16-rc3:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/arm/mm/cache-l2x0.c?id=98ea2dba65932ffc456b6d7b11b8a0624e2f7b95.

However, I'm interested in hearing your opinion about the I/O coherency
discussion in !SMP, and especially whether the TTB flags need to be
consistent with the PMD flags in terms of cache policy and
shareability. See
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/263524.html.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
