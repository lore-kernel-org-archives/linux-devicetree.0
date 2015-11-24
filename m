From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-icore-rqs: Add Engicam IMX6 Q7 initial
 support
Date: Tue, 24 Nov 2015 17:19:55 +0800
Message-ID: <20151124091955.GU11999@tiger>
References: <1447584853-12560-1-git-send-email-michael@amarulasolutions.com>
 <1447665552.3144.6.camel@pengutronix.de>
 <20151116112931.GA10464@panicking>
 <1447673895.3144.16.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447673895.3144.16.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 12:38:15PM +0100, Lucas Stach wrote:
<snip>
> > > > +		reg_sd3_vmmc: sd3_vmmc {
> > > > +			compatible = "regulator-fixed";
> > > > +			regulator-name = "P3V3_SD3_SWITCHED";
> > > > +			regulator-min-microvolt = <3300000>;
> > > > +			regulator-max-microvolt = <3300000>;
> > > > +			gpio = <&gpio1 4 GPIO_ACTIVE_LOW>;
> > > > +			regulator-boot-on;
> > > > +			regulator-always-on;
> > > > +		};
> > > 
> > > A lot of those regulators look like they don't need to be always-on.
> > > 
> > > Also the use of a simple-bus, while giving some structure to the DT is
> > > considered bad style as it doesn't reflect any real hardware.
> > > 
> > 
> > I will check how other boards do it
> > 
> Note that there are a lot of bad examples still around. What you need to
> do is essentially just remove the additional DT level of the regulator
> bus. The regulators are board components that belong to the same level
> as the usb hub below, or the memory node above.

Will kernel populate platform_device for these fixed regulators if they
are being put directly under root node?  Kernel used to only do that for
devices under simple-bus.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
