From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] [RFC] Using hierarchy irqdomian to implement MTK
 intpol.
Date: Thu, 25 Sep 2014 16:27:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1409251609500.4604@nanos>
References: <1411574696-1881-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411574696-1881-1-git-send-email-srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <srv_yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Sep 2014, Joe.C wrote:
> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Here's the first draft of using hierarchy irqdomain to implement MTK intpol
> support. I have tested it and intpol works fine. Before continue, I'd like
> to get your comments. This is based on Jiang's hierarchy irqdomian [1] and
> my mediatek SoC basic support [2].
> 
> Simplified block diagram for interrupt:
> 
>     ---------      ---------
>  ---| CIRQ  |------|ARM GIC|
>  ---|       |------|       |
>  ---|       |------|       |
>  ---|       |------|       |
>  ---|       |------|       |
>     ---------      ---------
>  
> In device tree, interrupt-parent for other devices is cirq, child of gic.
> This describe HW better and allow device to specify polarity as it is sent
> by the device. I'm using interrupt-parent to specify irq domain parent in
> cirq now. Maybe adding another name like 'interrupt-domain-parent' will be
> better.

I leave that to the DT folks.
 
> Currently only set_type is implement in CIRQ, but I think this could extended
> to cover all function gic_arch_extn provided.

Right. Marc, can you have a look at this whether you can see how that
might replace the rest of the arch_extn hackery?

At least the avoidance of the set_type mess looks pretty reasonable.
 
> In order to use hierarchy irq domain, gic can't use legacy irq domain anymore.
> If arm,hierarchy-irq-domain property is specified, GIC will work in hierarchy
> way and all interrupt must be set by device tree.
> 
> One thing worth mention is arg in irq_domain_alloc_irqs. On x86, msi is using
> struct irq_alloc_info, to pass data between irq domain. In irq_create_of_mapping(),
> of_phandle_args is used. All allocs in irq_domain chain will need to use same
> interrupt-cells formats.

Right, but we leave that to the architecture implementation. It needs
to be consistent within an architecture, so we should change the "void
*arg" to a well defined type. For OF architectures this would be
of_phandle_args, other architectures can define their own struct type
which allows to transport data between the domains. That ensures
compile time type checking.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
