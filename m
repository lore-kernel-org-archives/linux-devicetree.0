From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 02/13] ARM: dts: imx6qdl: SolidRun: move AR8035 into
 microsom
Date: Mon, 27 Nov 2017 23:13:32 +0000
Message-ID: <20171127231332.GP31757@n2100.armlinux.org.uk>
References: <20171127165134.GH31757@n2100.armlinux.org.uk>
 <E1eJMdi-0002qY-Ta@rmk-PC.armlinux.org.uk>
 <CAOMZO5C+z2nFv0pFz5XDY-DGtj2YvhU_kNh1H8mdq6GOUqc_Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5C+z2nFv0pFz5XDY-DGtj2YvhU_kNh1H8mdq6GOUqc_Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 06:12:38PM -0200, Fabio Estevam wrote:
> On Mon, Nov 27, 2017 at 2:52 PM, Russell King
> <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> 
> > +               pinctrl_microsom_enet_ar8035: microsom-enet-ar8035 {
> > +                       fsl,pins = <
> > +                               MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0x1b8b0
> > +                               MX6QDL_PAD_ENET_MDC__ENET_MDC           0x1b0b0
> > +                               /* AR8035 reset */
> > +                               MX6QDL_PAD_KEY_ROW4__GPIO4_IO15         0x130b0
> > +                               /* AR8035 interrupt */
> > +                               MX6QDL_PAD_DI0_PIN2__GPIO4_IO18         0x80000000
> 
> Please avoid  0x80000000 and use the real IOMUX value instead.
> 
> > +                               /* GPIO16 -> AR8035 25MHz */
> > +                               MX6QDL_PAD_GPIO_16__ENET_REF_CLK        0xc0000000
> 
> Ditto.
> 
> > +                               MX6QDL_PAD_RGMII_TXC__RGMII_TXC         0x80000000
> 
> Ditto.

This isn't new, this is merely moving the definition from an existing
file, and when moving definitions, the golden rule is you don't
modify them.  If changes are required they should be a separate
patch.

I'll try to read the correct values from the registers, but I see
this as an entirely separate thing from this series, and not
something that this series should be concerned with.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
