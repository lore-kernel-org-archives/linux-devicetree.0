From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri, 4 Dec 2015 16:56:17 +0000
Message-ID: <20151204165617.GW8644@n2100.arm.linux.org.uk>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
 <20151204162956.GA14978@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151204162956.GA14978@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 10:29:56AM -0600, Rob Herring wrote:
> On Fri, Dec 04, 2015 at 02:59:54PM +0100, Lucas Stach wrote:
> > +Vivante GPU core devices
> > +====================
> > +
> > +Required properties:
> > +- compatible: Should be "vivante,gc"
> 
> This should at least have the specific cores listed like gc-5000 or 
> whatever the numbering is. As is, I can't even tell if this a 2d or 3d 
> core.

Who cares whether it's a 2D or 3D core?  There are four options here:

2D
2D and 3D
3D
VG

All of these are determined by feature flags in the core - why should
DT have to specify this information when the hardware tells us, just
because we want something humanly visible?

> Also, it probably should have an SOC specific property to deal with SOC 
> specific configuration or integration.

Thus far, we're not aware of any SoC specific configuration of the
core.  Even if there was, I can't see it making much difference to
the DRM driver itself: the DRM driver mostly about command stream
queuing, GEM buffer management (both of which are independent of SoC
issues) and PM management, which is performed via runtime PM.

Where SoC specific integration would come in is the runtime PM, and
that goes as far as what clocks are present, which we already deal
with, power domains, which again we already deal with, and
interrupts - again, which are dealt with.

Given that this driver has been developed on two SoCs (Dove and iMX6)
which are radically different, I can't see any need for other SoC
specifics.

Did you have anything in mind?

Dove:
GC600 combined 2D and 3D GPU core, one clock, one interrupt, one PM
domain.

iMX6 S/DL/D/Q:
GC320 2D GPU core, GC880 or GC2000 3D GPU core, GC335 VG core, multiple
clocks, multiple interrupts, multiple PM domains.

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
