From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM-i.MX6Q-dts : Added USB_OTG Support
Date: Fri, 24 Jan 2014 23:32:46 +0800
Message-ID: <20140124153244.GB2780@S2101-09.ap.freescale.net>
References: <1390555724-9779-1-git-send-email-ashutosh.s@phytec.in>
 <20140124115005.GG814@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140124115005.GG814-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ashutosh singh <ashuleapyear-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 24, 2014 at 11:50:05AM +0000, Mark Rutland wrote:
> > @@ -18,6 +18,19 @@
> >  	memory {
> >  		reg = <0x10000000 0x80000000>;
> >  	};
> > +
> > +	regulators {
> > +		compatible = "simple-bus";
> 
> This is _not_ a simple bus. It doesn't have the required ranges
> property.

Maybe the real question is that if the required ranges property is
missing, why kernel still accepts it as a simple bus and populate the
devices under it?

> 
> Why do these need to be in a regulators container node? We don't group
> dma controllers under a dmas node, or uarts under a uarts node.

Grouping fixed clocks under 'clocks' and fixed regulators under
'regulators' is a common pattern which can be found on most of the ARM
dts files.

Shawn

> 
> > +
> > +		reg_usb_otg_vbus: usb_otg_vbus {
> > +			compatible = "regulator-fixed";
> > +			regulator-name = "usb_otg_vbus";
> > +			regulator-min-microvolt = <5000000>;
> > +			regulator-max-microvolt = <5000000>;
> > +			gpio = <&gpio4 15 0>;
> > +			enable-active-low;
> > +		};
> > +	};
> >  };
> 
> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
