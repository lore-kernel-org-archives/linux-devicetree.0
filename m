From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: vf610-zii-dev-rev-b: add interrupts for
 88e1545 PHY
Date: Fri, 22 Dec 2017 00:14:07 +0000
Message-ID: <20171222001407.GL10595@n2100.armlinux.org.uk>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
 <E1eRnWr-0006VS-1m@rmk-PC.armlinux.org.uk>
 <CACRpkdas5JJ4KHE4g=sPXag=3vQt4TS5EcZBsy=LRfw8tqcgOw@mail.gmail.com>
 <20171221134058.GA15416@lunn.ch>
 <20171221173235.GK10595@n2100.armlinux.org.uk>
 <CACRpkdarS+tPv5CG4bmFcPvc+=SJJcC1pbO7WSbsS5+yCuxh_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdarS+tPv5CG4bmFcPvc+=SJJcC1pbO7WSbsS5+yCuxh_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 11:53:47PM +0100, Linus Walleij wrote:
> On Thu, Dec 21, 2017 at 6:32 PM, Russell King - ARM Linux
> <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> 
> > What we have here is _really_ a shared interrupt between four
> > separate devices, and we need a way to sanely describe resources
> > shared between several device instances to pinmux.  Unfortunately,
> > it seems pinmux is designed around one device having exclusive use
> > of a resource, which makes it hard to describe shared interrupts in
> > DT.
> >
> > Given that DT should be a description of the hardware, and should be
> > independent of the OS implementation, I'd say this is a pinmux bug,
> > because pinmux gets in the way of describing the hardware correctly.
> > ;)
> 
> Hm that would be annoying. But when I look at it I think it would
> actually work. Did you try just assigning the same pin control
> state to all the PHY's and see what happens?
> 
> Just set
> pinctrl-names = "default";
> pinctrl-0 = <&pinctrl_mv88e1545>;
> 
> on all of them?

It was tried, DT was happy, but the kernel on boot complained because
pinctrl objected, which caused the drivers to fail to bind:

libphy: mdio: probed
vf610-pinctrl 40048000.iomuxc: pin VF610_PAD_PTB0 already requested by !mdio-mux!mdio@4!switch@0!mdio:00; cannot claim for !mdio-mux!mdio@4!switch@0!mdio:01
vf610-pinctrl 40048000.iomuxc: pin-22 (!mdio-mux!mdio@4!switch@0!mdio:01) status -22
vf610-pinctrl 40048000.iomuxc: could not request pin 22 (VF610_PAD_PTB0) from group pinctrl-mv88e1545  on device 40048000.iomuxc
Marvell 88E1545 !mdio-mux!mdio@4!switch@0!mdio:01: Error applying setting, reverse things back
Marvell 88E1545: probe of !mdio-mux!mdio@4!switch@0!mdio:01 failed with error -22
vf610-pinctrl 40048000.iomuxc: pin VF610_PAD_PTB0 already requested by !mdio-mux!mdio@4!switch@0!mdio:00; cannot claim for !mdio-mux!mdio@4!switch@0!mdio:02
vf610-pinctrl 40048000.iomuxc: pin-22 (!mdio-mux!mdio@4!switch@0!mdio:02) status -22
vf610-pinctrl 40048000.iomuxc: could not request pin 22 (VF610_PAD_PTB0) from group pinctrl-mv88e1545  on device 40048000.iomuxc
Marvell 88E1545 !mdio-mux!mdio@4!switch@0!mdio:02: Error applying setting, reverse things back
Marvell 88E1545: probe of !mdio-mux!mdio@4!switch@0!mdio:02 failed with error -22

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
