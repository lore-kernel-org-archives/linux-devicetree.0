From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] ARM: dts: vf610: add Miscellaneous System Control
 Module (MSCM)
Date: Fri, 13 Mar 2015 12:48:01 +0800
Message-ID: <20150313044759.GQ20455@dragon>
References: <1425249689-32354-1-git-send-email-stefan@agner.ch>
 <1425249689-32354-4-git-send-email-stefan@agner.ch>
 <20150311004812.GU20455@dragon>
 <59b0d98827cb4e7497de81e1c0826964@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59b0d98827cb4e7497de81e1c0826964-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2015 at 10:03:08AM +0100, Stefan Agner wrote:
> On 2015-03-11 01:48, Shawn Guo wrote:
> > On Sun, Mar 01, 2015 at 11:41:29PM +0100, Stefan Agner wrote:
> >> Add the Miscellaneous System Control Module (MSCM) to the base
> >> device tree for Vybrid SoC's. This module contains registers
> >> to get information of the individual and current (accessing)
> >> CPU. In a second block, there is an interrupt router, which
> >> handles the routing of the interrupts between the two CPU cores
> >> on VF6xx variants of the SoC. However, also on single core
> >> variants the interrupt router needs to be configured in order
> >> to receive interrupts on the CPU's interrupt controller. Almost
> >> all peripheral interrupts are routed through the router, hence
> >> the MSCM module is the default interrupt parent for this SoC.
> >>
> >> In a earlier commit the interrupt nodes were moved out of the
> >> peripheral nodes and specified in the CPU specific vf500.dtsi
> >> device tree. This allowed to use the base device tree vfxxx.dtsi
> >> also for a Cortex-M4 specific device tree, which uses different
> >> interrupt nodes due to the NVIC interrupt controller. However,
> >> since the interrupt parent for peripherals is the MSCM module
> >> independently which CPU the device tree is used for, we can move
> >> the interrupt nodes into the base device tree vfxxx.dtsi again.
> >> Depending on which CPU this base device tree will be used with,
> >> the correct parent interrupt controller has to be assigned to
> >> the MSCM-IR node (GIC or NVIC). The driver takes care of the
> >> parent interrupt controller specific needs (interrupt-cells).
> >>
> >> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> > 
> > Stefan,
> > 
> > I guess this patch has a run-time dependency on the first two in the
> > series, right?  Or put it another way, if I apply this single patch on
> > my branch, the dtb and kernel built from the same branch do not work
> > together, right?  If so, we will need to either wait for the first two
> > hit mainline or pull Jason's irqchip/vybrid branch into my tree as
> > prerequisite (irqchip/vybrid needs to be stable).
> > 
> > Shawn
> 
> Yes, that is true. The driver need to be in place in order to
> successfully boot with the new device tree.

Okay.  Pulled Jason's irqchip/vybrid branch in, and applied the patch.

Stefan,

There was a conflict on device dspi1 when applying the patch to my
imx/dt branch.  Please take a look to see if I solved it correctly.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
