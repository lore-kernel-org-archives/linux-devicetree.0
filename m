From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: armada388-clearfog: add phy reset gpio-hog
Date: Thu, 5 Jan 2017 10:16:20 +0000
Message-ID: <20170105101620.GR14217@n2100.armlinux.org.uk>
References: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
 <E1cO4Vz-00005t-8n@rmk-PC.armlinux.org.uk>
 <871swig5b3.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <871swig5b3.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 04, 2017 at 05:26:08PM +0100, Gregory CLEMENT wrote:
> Hi Russell,
>  
>  On lun., janv. 02 2017, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> 
> 
> It would be nice to have some word here about this patch. Especially why
> we need it now. I guess it is for being less dependent on the
> initialization done by the bootloader but maybe you have other reasons.

I'm not sure I follow.  This is adding it to the new platform, not the
old one.  I guess I should've rolled this into the patch creating the
clearfog-base dts file, and this question wouldn't have come up.

> 
> Thanks,
> 
> Gregory
> 
> > Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/armada-388-clearfog-base.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/armada-388-clearfog-base.dts b/arch/arm/boot/dts/armada-388-clearfog-base.dts
> > index f86e1876fb38..da788ea40717 100644
> > --- a/arch/arm/boot/dts/armada-388-clearfog-base.dts
> > +++ b/arch/arm/boot/dts/armada-388-clearfog-base.dts
> > @@ -74,7 +74,17 @@
> >  	phy = <&phy1>;
> >  };
> >  
> > +&gpio0 {
> > +	phy1_reset {
> > +		gpio-hog;
> > +		gpios = <19 GPIO_ACTIVE_LOW>;
> > +		output-low;
> > +		line-name = "phy1-reset";
> > +	};
> > +};
> > +
> >  &mdio {
> > +	pinctrl-0 = <&mdio_pins &microsom_phy_clk_pins &clearfog_phy_pins>;
> >  	phy1: ethernet-phy@1 {
> >  		/*
> >  		 * Annoyingly, the marvell phy driver configures the LED
> > @@ -87,6 +97,11 @@
> >  };
> >  
> >  &pinctrl {
> > +	/* phy1 reset */
> > +	clearfog_phy_pins: clearfog-phy-pins {
> > +		marvell,pins = "mpp19";
> > +		marvell,function = "gpio";
> > +	};
> >  	rear_button_pins: rear-button-pins {
> >  		marvell,pins = "mpp44";
> >  		marvell,function = "gpio";
> > -- 
> > 2.7.4
> >
> 
> -- 
> Gregory Clement, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
