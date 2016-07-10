From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-388-clearfog: remove duplicate mdio
 entry
Date: Mon, 11 Jul 2016 00:27:43 +0200
Message-ID: <20160710222743.GN8426@lunn.ch>
References: <E1bMGdu-00005c-Dy@rmk-PC.armlinux.org.uk>
 <20160710203751.GB26397@lunn.ch>
 <20160710204546.GS1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160710204546.GS1041-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 10, 2016 at 09:45:46PM +0100, Russell King - ARM Linux wrote:
> On Sun, Jul 10, 2016 at 10:37:51PM +0200, Andrew Lunn wrote:
> > The armada-38x.dtsi has
> > 
> >                                 ref_clk0_pins: ref-clk-pins-0 {
> >                                         marvell,pins = "mpp45";
> >                                         marvell,function = "ref";
> >                                 };
> > 
> > which you could reference rather then defining it yourself.
> 
> Weren't these going to be deleted from the main SoC dtsi files,
> eventually?  I thought that was the idea, to prevent cluttering
> up the .dtb files with nodes which aren't ever used.

I've not heard they are going to be removed....

Having work on mvebu, and a Freescale Vybrid board, i see two
different styles. mvebu defines all the common pinctrl values in the
.dtsi file, so making the .dts file pretty minimalist. For the vybrid
board there was nothing in the .dtsi file, the dts file is huge, and i
made at least one error, missing at required pin which took me a while
to debug.

I would also say cluttered .dtb because of unused nodes it a compiler
issue. Why does it not optimise them out?

   Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
