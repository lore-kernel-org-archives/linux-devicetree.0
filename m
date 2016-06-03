From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH] dt documentation: etnaviv: add devicetree bindings
Date: Fri, 3 Jun 2016 16:20:12 +0100
Message-ID: <20160603152012.GD1041@n2100.armlinux.org.uk>
References: <E1b8qYp-0005n7-9D@rmk-PC.armlinux.org.uk>
 <1464966119.32235.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464966119.32235.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 05:01:59PM +0200, Lucas Stach wrote:
> Am Freitag, den 03.06.2016, 15:58 +0100 schrieb Russell King:
> > From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > Etnaviv follows the same priciple as imx-drm to have a virtual
> > master device node to bind all the individual GPU cores together
> > into one DRM device.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > ---
> > This was supposed to be merged along with Etnaviv, but for whatever
> > reason, Etnaviv was merged without this patch.  Can someone please
> > merge this?  I won't be re-sending this as I'm deleting it from my
> > tree.
> > 
> NACK
> 
> The etnaviv bindings are mainline. They just moved location to
> Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt,
> following the reorganization done by Rob Herring.

It would be good if you could've kept the other Etnaviv maintainers
informed of such changes.  It wasn't obvious that such a change had
been made when etnaviv was merged.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
